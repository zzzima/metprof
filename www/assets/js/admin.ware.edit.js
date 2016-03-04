$(function () { 
    if(is_saved==1){ notify('Информация сохранена','success'); }
    
    $("textarea").tinymce({
        selector:'textarea',
        menubar: false,
        content_style: "p {font-size: 14px;}"        
    });
    
    $('#editTab a').click(function (e) {
      e.preventDefault();
      $(this).tab('show');
    });

    $('#fileupload').bind('fileuploaddestroyed', function (e, data) {
        if($(".label-ismain").length==0){
            $(".fileupload-buttonbar .btn.fileinput-main").show();
        }
    });

    $('#fileupload').bind('fileuploadcompleted', function (e, data) {
        if($(".label-ismain").length>0){
            $(".fileupload-buttonbar .btn.fileinput-main").hide();
        }         
        var $tr_main = $(".files tr.row-ismain");
        $tr_main.insertBefore($(".files tr:first"));        
    });
    // end of fileupload listeners
    
    $("#b_back").click(function(){
        var _id = $("#f_id").val();
        var _form = $("<form action='/admin/?a=catalog' method='POST'>");
        $("#helper").append(_form);
        _form.append($("<input type='hidden' name='ware_id'>").val(_id));
        _form.submit();
    });
    
    $("#b_save").click(function(){
        var go = true;
        $("#form-base").find("input:text,textarea").each(function(){            
            if($(this).val().length==0){ 
                var $id = $(this).attr("id");
                $("label[for="+$id+"] span.label-error").text("Обязательное поле");
                go = false;
            }
        });
        var $selected = $('#catalog_tree').jstree(true).get_selected(false);
        if($selected.length===0){ 
            $("#err_parent_id").text("Выберите хотя бы один каталог");
            go = false; 
        }
        else{
            $selected = $.map($selected, function(e, i){ return (e.replace('c','')); }).join(',');    
            $("#f_parent_id").val($selected);
        }
        
        if(go){ $("#form-base").submit(); }
    });
    
    $("#form-base").find("input:text,textarea").click(function(){
        var $id = $(this).attr("id");
        $("label[for="+$id+"] span.label-error").text("");
    });
    $("#catalog_tree").click(function(){
        $("#err_parent_id").text("");
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
                    data = getNodeChildrens(node.id, "catalog", true);
                }
                //var data =  node.id === '#' ? json_tree : getNodeChildrens(node.id);
                data = typeof(data) === 'undefined' ? ['undefined'] : data;
                callback.call(this, data);
            }
        },
        'plugins' : ['checkbox'],
        'checkbox': {
            'three_state': false
        }
    });        
});

