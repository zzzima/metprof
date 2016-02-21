<!DOCTYPE html>
<html>
<head>
<title>MetProf - admin</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<link rel="stylesheet" href="/assets/tparty/bootstrap/css/bootstrap.min.css">
{section name="css" loop=$stylesheet}
    <link rel='stylesheet' href='/assets/{$stylesheet[css]}' type='text/css'>
{/section}

<script src="/assets/tparty/jquery/jquery-2.2.0.min.js"></script>
<script src="/assets/tparty/bootstrap/js/bootstrap.min.js"></script>   

{section name="js" loop=$jsscripts}
    <script language="javascript" type="text/javascript" src="/assets/{$jsscripts[js]}"></script>
{/section}

<!--[if lt IE 10]>
<script src="/assets/js/html5shiv.js"></script>
<![endif]-->    
{if $jsvars|count > 0}
<script>
{foreach from=$jsvars key=key item=val}
    {$key} = {$val};
{/foreach} 
</script>    
{/if}
<script>
{literal}
    function notificationView(text, type) {
        //type: success, info, warning, danger
        if (!text || !type) return false;
        /*var $m = $("<div>").addClass(type).html(text);
        var time = 4000;
        if (type == "error") {time = 20000;}
        if (type == "alert") {time = 10000;}

        $("#notification").append($m);
        //$m.slideDown();
        $m.click(function(){$m.remove()});
        $m.idle(time).fadeOut(300, function(){$m.remove();});*/
        var $ntf = $("#notification");
        $ntf.removeClass("alert-success alert-info alert-warning alert-danger")
        $ntf.addClass("alert-"+type);
        
        var time = 10000;
        if(type=="danger"){ time = 20000; }
        var $mess = $("<div>").html(text);
        
        $ntf.append($mess);
        $ntf.click(function(){ $mess.remove(); $ntf.alert('close'); });
        $ntf.idle(time).fadeOut(300, function(){ $mess.remove(); $ntf.alert('close'); });        
        
        $ntf.alert();
    }
    
    $(function () {
        $('[data-toggle="popover"]').popover();
        
        $(".alert").alert('close'); 
        
        $("#testnotif").click(function(){
        notificationView("Hey!! It is me!", "danger");
        });

    });
{/literal}
</script>

</head>
<body>      
<header>
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
      <a class="navbar-brand" href="#">МетПроф Админ</a>
    </div>
    {if !$nonav}
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/admin/?a=catalog">Каталог</a></li>
        <li><a href="#">Настройки</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.php">Выход</a></li>
      </ul>        
    </div><!-- /.navbar-collapse -->
    {/if}
  </div><!-- /.container-fluid -->
</nav>
</header> 
<div id="notification" class="alert alert-info fade in">
</div>  
<a id="testnotif" href="#">notification</a>
<main>
    

