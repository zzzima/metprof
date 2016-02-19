<!DOCTYPE html>
<html>
<head>
<title>MetProf - admin</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<link rel="stylesheet" href="/assets/tparty/bootstrap/css/bootstrap.min.css">
<script src="/assets/tparty/jquery/jquery-2.2.0.min.js"></script>
<script src="/assets/tparty/bootstrap/js/bootstrap.min.js"></script>   

<!--[if lt IE 10]>
<script src="/assets/js/html5shiv.js"></script>
<![endif]-->    

<script>
  $(function () {
    $('[data-toggle="popover"]').popover()
  })
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
        <li class="active"><a href="#">Каталог</a></li>
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
<main>
    

