function notify_confirm(){
    PNotify.prototype.options.styling = "bootstrap3";
    var myStack = {"dir1":"down", "dir2":"right", "push":"top", "modal":true};
    new PNotify({
        title: 'Обратите внимание',
        text: 'Категория будет размещена в корне каталога.',
        icon: 'glyphicon glyphicon-info-sign',
        type: 'info',
        hide: false,
        addclass: "stack-modal",
        stack: myStack,        
        confirm: {
            confirm: true,
            buttons: [{
                text: 'Ok',
                addClass: 'btn-default',
                click: function(notice) {
                    $("#form-base").submit();
                }
            },
            {
                text: 'Отмена',
                addClass: 'btn-default',
                click: function(notice) {
                    notice.remove();
                }
            },
            null]
        },
        buttons: {
            closer: false,
            sticker: false
        },
        history: {
            history: false
        }
    });     
}

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
    
    // fileupload listeners   
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
        _form.append($("<input type='hidden' name='open_ids'>").val(_id));
        _form.submit();
    });
    
    $("#b_save").click(function(){
        var go = true;
        var root = false;
        $("#form-base").find("input:text,textarea").each(function(){            
            if($(this).val().length==0){ 
                var $id = $(this).attr("id");
                $("label[for="+$id+"] span.label-error").text("Обязательное поле");
                go = false;
            }
        });
        
        var $selected = $('#catalog_tree').jstree(true).get_selected(false);
        root = ($selected.length==0);
        
        $selected = root ? 0 : $selected[0].replace('c','');    
        $("#f_parent_id").val($selected);
        
        if(go){ 
            //if(root){ notify_confirm(); }
            //else { $("#form-base").submit(); }
            $("#form-base").submit();
        }
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

    $('#catalog_tree').on("select_node.jstree", function (_node, _selected, _e) {
        var $selected = _selected.selected;
        $.each($selected, function(i,x){
            if(x != _selected.node.id){
                $('#catalog_tree').jstree().deselect_node($selected[i]);
            }
        });
    });
});

