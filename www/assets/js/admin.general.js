function notify(text, type){
    //type: error, success, info, notice
    var title;
    switch(type){
        case "error": title ="Error"; break;
        case "success": title ="Success"; break;
        case "info": title ="Info"; break;
        case "notice": title="Notice"; break;
    }
    var opts = {
        title: title,
        text: text,
        type: type,
        delay: 10000
    };
    new PNotify(opts);
}

