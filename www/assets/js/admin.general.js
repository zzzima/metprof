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
    new PNotify(opts);
}

