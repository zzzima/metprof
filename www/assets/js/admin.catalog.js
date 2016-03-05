function gotoEdit(id, op){
    var form = $("#form-go");
    if(id == 0){
        op.parent_id = (typeof op.parent_id !== 'undefined') ? op.parent_id : 0;
        if(!$.isNumeric(op.parent_id)){ 
            op.parent_id = op.parent_id.replace('c','');
            form.find("#parent_id").val(op.parent_id); 
        }
    }
    var _action = (op.type=="catalog") ? "/admin/?a=editcatalog&id="+id : "/admin/?a=editware&id="+id;
    form.attr("action",_action);
    form.submit();
}

function deleteCatalog(node){
    var a = getNodeAttrs(node.id);
    if(a.subs>0 || a.ware>0){
        notify("Невозможно удалить не пустую категорию.", "error");
        return false;
    }
    
    var bind = {
        ajaxaction: "delete_catalog",
        node_id: a.id
    };
    $.ajax({
        type: "POST",
        url: "/admin/ajax.php",
        data: bind,
        dataType: "json",
        async: false,
        cache: false,
        success: function (data, textStatus) {
            var dt = data;   
            if(dt.status === "error"){ notify(dt.message, "error"); }
            if(dt.status === "ok"){                
                var tree = $('#catalog_tree');
                tree.jstree("delete_node", $("#"+node.id));
                tree.jstree("select_node", '#'+node.parent, true);
                
                var a_parent = getNodeAttrs(node.parent);
                setNodeAttrs(node.parent,{subs: (+a_parent.subs-1)});

                notify("Категория \""+node.text+"\" успешно удалена", "success");
            }
        }
    });
}

function deleteWare(node){
    var a = getNodeAttrs(node.id);
    var bind = {
        ajaxaction: "delete_ware",
        node_id: a.id
    };
    $.ajax({
        type: "POST",
        url: "/admin/ajax.php",
        data: bind,
        dataType: "json",
        async: false,
        cache: false,
        success: function (data, textStatus) {
            var dt = data;   
            if(dt.status === "error"){ notify(dt.message, "error"); }
            if(dt.status === "ok"){                
                var tree = $('#catalog_tree');
                for(var i in dt.data){
                    var c_node_id = "c"+dt.data[i].id;
                    if(NodeIsExists(c_node_id)){
                        var a_parent = getNodeAttrs(c_node_id);
                        tree.jstree("delete_node", $("#"+c_node_id+"_w"+a.id));
                        tree.jstree("select_node", '#'+c_node_id, true);            
                        setNodeAttrs(c_node_id,{ware: (+a_parent.ware-1)});
                    }                    
                }
                notify("Товар \""+node.text+"\" успешно удален", "success");
            }
        }
    });
}

$(function () { 
    $("#b_add").click(function(){
        gotoEdit(0, {type: "catalog", parent_id: 0});    
    });
    
    $('#catalog_tree').jstree({ 
        'core' : {
            //'data' : json_tree
            "check_callback" : true,
            'data': function (node, callback) {               
                var data;
                if(node.id === '#'){
                    data = json_tree;
                }else{
                    var a = getNodeAttrs(node.id);
                    var type = (+a.ware>0) ? "ware" : "catalog";
                    data = getNodeChildrens(node.id, type);
                }
                //var data =  node.id === '#' ? json_tree : getNodeChildrens(node.id);
                data = typeof(data) === 'undefined' ? ['undefined'] : data;
                callback.call(this, data);
            }
        },
        'plugins' : ['contextmenu', "dnd"],
        'dnd':{
            
        },
        'contextmenu': {
            'items': function(node){
                var items = {};                
                var a = getNodeAttrs(node.id);

                items = {
                  'addcatalog': {
                    'label': "Добавить категорию",
                    '_disabled': (+a.ware>0),
                    'action': function () { gotoEdit(0, {type: a.type, parent_id: node.id}); }
                  },
                  /*'addware': {
                    'label': "Добавить товар",
                    '_disabled': (+a.subs>0),
                    'action': function () { gotoEdit(0, {type: "ware", parent_id: node.id}); }
                  },*/                      
                  'editcatalog': {
                    'label': "Изменить категорию",
                    '_disabled': (a.type=='ware'),
                    'action': function () { gotoEdit(a.id, {type: a.type}); }
                  },
                  /*'editware': {
                    'label': "Изменить товар",
                    '_disabled': (a.type=='catalog'),
                    'action': function () { gotoEdit(a.id, {type: a.type}); }
                  },*/                              
                  'deletecatalog': {
                    'label': "Удалить категорию",
                    '_disabled': (a.type=='ware'),
                    'action': function () { deleteCatalog(node); }
                  },
                  /*'deleteware': {
                    'label': "Удалить товар",
                    '_disabled': (a.type=='catalog'),
                    'action': function () { deleteWare(node); }
                  }*/                      
                };

                switch (a.type){
                    case "catalog":
                        if(+a.subs>0) delete items.addware;
                        delete items.editware;
                        delete items.deleteware;
                        break;
                    case "ware":
                        delete items.addware;
                        delete items.addcatalog;                        
                        delete items.editcatalog;
                        delete items.deletecatalog;                            
                        break;
                }   
                return items;
            }
        }                
    });    
});

