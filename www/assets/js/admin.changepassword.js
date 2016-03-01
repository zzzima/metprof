function check_password(){
    var go = false;
    
    var bind = {
        ajaxaction: "check_password",
        password: $("#f_password_old").val(),
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
            //if(dt.status === "error"){ /*notify(dt.message, "error");*/ }
            if(dt.status === "ok"){
                go = true;
            }
        }
    });
    
    return go;
}

$(function(){
    if(typeof is_saved !== 'undefined'){
        if(is_saved==1){ notify('Пароль успешно сменен','success'); }
        if(is_saved==0){ notify('При смене пароля возникла ошибка','error'); }
    }
    
    $("#b_save").click(function(){
        var _form = $("#form-base");
        var go = true;
        $("#form-base").find("input:password").each(function(){            
            if($(this).val().length==0){ 
                var $id = $(this).attr("id");
                $("label[for="+$id+"] span.label-error").text("Обязательное поле");
                go = false;
            }
        });        
        if(!go){ return false; }
        
        //check old password
        if(!check_password()){
            $("label[for=f_password_old] span.label-error").text("Неверный текущий пароль");
            return false; 
        }
        //check if new and confirmation matched
        if($("#f_password_new").val()!==$("#f_password_new1").val()){
            $("label[for=f_password_new] span.label-error").text("Пароль и подтверждение не совпадают");
            return false;
        }
        _form.submit();
    }); 
    
    $("#form-base").find("input:password").click(function(){
        var $id = $(this).attr("id");
        $("label[for="+$id+"] span.label-error").text("");
    });
    
});