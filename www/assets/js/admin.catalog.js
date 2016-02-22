function getNodeChildrens(node_id, type){
    var childrens;
    var bind = {
        ajaxaction: "get_catalog_treenode",
        node_id: node_id.replace('c',''),
        type: type
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
                childrens = dt.data;
            }
        }
    });
    
    return childrens;
}

function gotoEdit(id, op){
    var form = $("#form-go");
    if(id == 0){
        if(typeof(op.parent_id) !== 'undefined'){ $("#parent_id").val(op.parent_id); }
    }
    var _action = (op.type=="catalog") ? "/admin/?a=addcatalog&id="+id : "/admin/?a=addcatalog&id="+id
    form.attr("action",_action);
    form.submit();
}

function deleteCatalog(node){
    var a = getNodeAttrs(node.id);
    if(a.subs>0 || a.ware>0){
        notify("Невозможно удалить папку \""+node.text+"\". Сначала нужно удалить или переместить ее содержимое.", "error");
        return false;
    }
    
    var bind = {
        ajaxaction: "delete_catalog",
        node_id: node.id.replace('c','')
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
                notify("Папка \""+node.text+"\" успешно удалена", "success");
            }
        }
    });
}

function deleteWare(node){
    var a = getNodeAttrs(node.id);

    var bind = {
        ajaxaction: "delete_ware",
        node_id: node.id.replace('w','')
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
                notify("Папка \""+node.text+"\" успешно удалена", "success");
            }
        }
    });
}

function getNodeAttrs(node_id){
    var li = $("li#"+node_id+".jstree-node");
    var a = {       
        type: li.data("type"),
        subs: li.data("subs"),
        ware: li.data("ware") 
    }
    return a;
}

$(function () { 
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
        'plugins' : ['contextmenu'],
        'contextmenu': {
            'items': function(node){
                var items = {};                
                var a = getNodeAttrs(node.id);

                items = {
                  'addcatalog': {
                    'label': "Добавить папку",
                    '_disabled': (+a.ware>0),
                    'action': function () { gotoEdit(0, {type: a.type, parent_id: node.id}); }
                  },
                  'addware': {
                    'label': "Добавить товар",
                    '_disabled': (+a.subs>0),
                    'action': function () { gotoEdit(0, {type: a.type, parent_id: node.id}); }
                  },                      
                  'editcatalog': {
                    'label': "Изменить папку",
                    '_disabled': (a.type=='ware'),
                    'action': function () { gotoEdit(node.id, {type: a.type}); }
                  },
                  'editware': {
                    'label': "Изменить товар",
                    '_disabled': (a.type=='catalog'),
                    'action': function () { gotoEdit(node.id, {type: a.type}); }
                  },                              
                  'deletecatalog': {
                    'label': "Удалить папку",
                    '_disabled': (a.type=='ware'),
                    'action': function () { deleteCatalog(node); }
                  },
                  'deleteware': {
                    'label': "Удалить товар",
                    '_disabled': (a.type=='catalog'),
                    'action': function () { deleteWare(node); }
                  }                      
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

