<!DOCTYPE html>
<html>
<head>
<title><!--Test-->МетПроф</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<link rel="stylesheet" href="/assets/tparty/bootstrap/css/bootstrap.min.css">
<link media="all" rel="stylesheet" type="text/css" href="/assets/tparty/pnotify/pnotify.custom.min.css" />
<link media="all" rel="stylesheet" type="text/css" href="/assets/css/style_admin.css" />
{section name="css" loop=$stylesheet}
    <link rel='stylesheet' href='{$stylesheet[css]}' type='text/css'>
{/section}

<script src="/assets/tparty/jquery/jquery-2.2.0.min.js"></script>
<!--script src="/assets/tparty/jquery/jquery-ui.min.js"></script-->
<script src="/assets/tparty/bootstrap/js/bootstrap.min.js"></script>   
<script type="text/javascript" src="/assets/tparty/pnotify/pnotify.custom.min.js"></script>
<script src="/assets/js/admin.general.js"></script>   
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
    $(function () {
        $('[data-toggle="popover"]').popover();
        
        /*$("#testnotif").click(function(){ 
            notify("Hey! Look at this!", "notice");
        });*/
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
        <li class="active"><a href="/admin/?a=catalog">Каталог<!--Catalog--></a></li>
        <li class="dropdown">
          <a href="/admin/?a=changepassword" class="dropdown-toggle" data-toggle="dropdown">Настройки <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="/admin/?a=changepassword">Сменить пароль</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.php">Выход<!--Logout--></a></li>
      </ul>        
    </div><!-- /.navbar-collapse -->
    {/if}
  </div><!-- /.container-fluid -->
</nav>
</header>
<div id="notification"></div>  
<!--a id="testnotif" href="#">notification</a-->
<main>
    

