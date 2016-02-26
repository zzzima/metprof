function notify(text, type){
    //type: error, success, info, notice
    var title;
    switch(type){
        case "error": title ="Ошибка"; break;
        case "success": title ="Все получилось"; break;
        case "info": title ="Информация"; break;
        case "notice": title="Внимание"; break;
    }
    var opts = {
        title: title,
        text: text,
        type: type,
        delay: 10000
    };
    
    PNotify.prototype.options.styling = "bootstrap3";    
    new PNotify(opts);
}

function getNodeChildrens(node_id, type, editmode){
    editmode = (typeof editmode === 'undefined') ? false : editmode;
    var a = getNodeAttrs(node_id);      
    var childrens;
    var bind = {
        ajaxaction: "get_catalog_treenode",
        node_id: a.id,
        type: type,
        editmode: editmode
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

function getNodeAttrs(node_id){
    var li = $("li#"+node_id+".jstree-node");
    var a = {       
        id: li.data("id"),
        type: li.data("type"),
        subs: li.data("subs"),
        ware: li.data("ware"), 
        text: li.data("text") 
    };
    return a;
}

function setNodeAttrs(node_id,attr){
    //console.log(node_id,attr);
    var li = $("li#"+node_id+".jstree-node");  
    for (var key in attr) {
        li.data(key,attr[key]); 
    }
}

function NodeIsExists(node_id){
    var li = $("li#"+node_id+".jstree-node");
    return (li.length>0)
}