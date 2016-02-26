$(function () { 
    if(is_saved==1){ notify('Информация сохранена','success'); }
       
    $("#b_save").click(function(){
        var go = true;
        $("#form-base").find("input:text,textarea").each(function(){            
            if($(this).val().length==0){ 
                var $id = $(this).attr("id");
                $("label[for="+$id+"] span.label-error").text("Обязательное поле");
                go = false;
            }
        });
        if(go){ $("#form-base").submit(); }
    });
    
    $("#form-base").find("input:text,textarea").click(function(){
        var $id = $(this).attr("id");
        $("label[for="+$id+"] span.label-error").text("");
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
                    //var a = getNodeAttrs(node.id);
                    //var type = (+a.ware>0) ? "ware" : "catalog";                    
                    data = getNodeChildrens(node.id, "catalog");
                }
                //var data =  node.id === '#' ? json_tree : getNodeChildrens(node.id);
                data = typeof(data) === 'undefined' ? ['undefined'] : data;
                callback.call(this, data);
            }
        }
    });        
});

