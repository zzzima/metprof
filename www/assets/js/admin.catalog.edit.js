$(function () { 
    if(is_saved==1){ notify('Информация сохранена','success'); }
    
    $('#fileupload').bind('fileuploaddone', function (e, data) {
        $(".fileupload-buttonbar .btn.fileinput-button").hide();
        $(".fileupload-buttonbar .btn.start").hide();
        $(".fileupload-buttonbar .btn.cancel").hide();
    });
    
    $('#fileupload').bind('fileuploaddestroyed', function (e, data) {
        $(".fileupload-buttonbar .btn.fileinput-button").show();
        $(".fileupload-buttonbar .btn.start").show();
        $(".fileupload-buttonbar .btn.cancel").show();       
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
        if(go){ $("#form-base").submit(); }
    });
    
    $("#form-base").find("input:text,textarea").click(function(){
        var $id = $(this).attr("id");
        $("label[for="+$id+"] span.label-error").text("");
    });
});

