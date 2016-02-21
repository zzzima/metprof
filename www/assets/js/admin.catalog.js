function getNodeChildrens(node_id, type){
    var childrens;
    var bind = {
        ajaxaction: "get_catalog_treenode",
        node_id: node_id
    };
    $.ajax({
        type: "POST",
        url: "/admin/ajax.php",
        data: bind,
        async: false,
        cache: false,
        success: function (data, textStatus) {
            var dt = data.dt;    
            if(dt.status === "error"){ ErrorDialog(dt.message); }
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

function deleteLocation(node){
    //console.log(node);
    var bind = {
        ajaxaction: "delete_location",
        loc_id: node.id
    };
    $.ajax({
        type: "POST",
        url: "/admin/utility/lookuplists/ajax/",
        data: bind,
        async: false,
        cache: false,
        success: function (data, textStatus) {
            var dt = data.dt;    
            if(dt.status === "error"){ ErrorDialog(dt.message); }
            if(dt.status === "ok"){                
                var tree = $("#loc_tree");
                tree.jstree("delete_node", $("#"+node.id));
                tree.jstree("select_node", '#'+node.parent, true);
                var loc = getLocation();
                if(loc.value == node.id){
                    loadLocationSublist(node.parent, node.li_attr["data-level"]);
                }
            }
        }
    });
}


$(function () { 
    $('#catalog_tree').jstree({ 
        'core' : {
            //'data' : json_tree
            "check_callback" : true,
            'data': function (node, callback) {
                var data =  node.id === '#' ? json_tree : getNodeChildrens(node.id);
                data = typeof(data) === 'undefined' ? ['undefined'] : data;
                callback.call(this, data);
            }
        },
        'plugins' : ['contextmenu'],
        'contextmenu': {
            'items': function(node){
                var items = {};
                
                var li = $("li#"+node.id+".jstree-node");
                var type = li.data("type");
                var subs = li.data("subs");
                var ware = li.data("ware");

                items = {
                  'addcatalog': {
                    'label': "Добавить папку",
                    '_disabled': (+ware>0),
                    'action': function () { gotoEdit(0, {type: type, parent_id: node.id}); }
                  },
                  'addware': {
                    'label': "Добавить товар",
                    '_disabled': (+subs>0),
                    'action': function () { gotoEdit(0, {type: type, parent_id: node.id}); }
                  },                      
                  'editcatalog': {
                    'label': "Изменить папку",
                    '_disabled': (type=='ware'),
                    'action': function () { gotoEdit(node.id, {type: type}); }
                  },
                  'editware': {
                    'label': "Изменить товар",
                    '_disabled': (type=='catalog'),
                    'action': function () { gotoEdit(node.id, {type: type}); }
                  },                              
                  'deletecatalog': {
                    'label': "Удалить папку",
                    '_disabled': (type=='ware'),
                    'action': function () { deleteCatalog(node); }
                  },
                  'deleteware': {
                    'label': "Удалить товар",
                    '_disabled': (type=='catalog'),
                    'action': function () { deleteWare(node); }
                  }                      
                };

                switch (type){
                    case "catalog":
                        if(+subs>0) delete items.addware;
                        delete items.editware;
                        delete items.deleteware;
                        break;
                    case "ware":
                        if(+ware>0) delete items.addware;
                        delete items.editware;
                        delete items.deleteware;                            
                        break;
                }   
                return items;
            }
        }                
    });    
});

