<!DOCTYPE html>
<html class="wide wow-animation desktop landscape" lang="en">
    <head>
        <title>МетАллекс - металоизделия</title>        
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">        
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700">        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link href="/assets/css/fonts.css" rel="stylesheet" type="text/css">     
        
        <style type="text/css">{literal}
            .gm-style .gm-style-mtc label,.gm-style .gm-style-mtc div{font-weight:400}
        {/literal}</style>
        <style type="text/css">{literal}
            .gm-style .gm-style-cc span,.gm-style .gm-style-cc a,.gm-style .gm-style-mtc div{font-size:10px}
        {/literal}</style>
        <style type="text/css">{literal}
            @media print {  .gm-style .gmnoprint, .gmnoprint {    display:none  }}@media screen {  .gm-style .gmnoscreen, .gmnoscreen {    display:none  }}
        {/literal}</style>
        <style type="text/css">{literal}
            .gm-style{font-family:Roboto,Arial,sans-serif;font-size:11px;font-weight:400;text-decoration:none}.gm-style img{max-width:none}
        {/literal}</style>

        <link rel="stylesheet" href="/assets/css/user.bootstrap.missed.css">
        <link rel="stylesheet" href="/assets/css/grid.css">
        <link rel="stylesheet" href="/assets/css/style.css">
        <link rel="stylesheet" href="/assets/css/camera.css">        
        <!--link rel="icon" href="/images/favicon.ico" type="image/x-icon"-->
        {section name="css" loop=$stylesheet}
            <link rel='stylesheet' href='{$stylesheet[css]}' type='text/css'>
        {/section}

        <script src="/assets/tparty/jquery/jquery-1.11.3.min.js"></script>
        <script src="/assets/tparty/jquery/jquery-migrate-1.2.1.js"></script>
        <script src="/assets/tparty/misc/device.min.js"></script>   
        {section name="js" loop=$jsscripts}
            <script language="javascript" type="text/javascript" src="/assets/{$jsscripts[js]}"></script>
        {/section}

        {if isset($fancybox) && $fancybox}
            <!-- Add mousewheel plugin (this is optional) -->
            <script type="text/javascript" src="/assets/tparty/fancybox2/lib/jquery.mousewheel-3.0.6.pack.js"></script>
            <!-- Add fancyBox -->
            <script type="text/javascript" src="/assets/tparty/fancybox2/source/jquery.fancybox.pack.js?v=2.1.5"></script>    
            <link rel="stylesheet" href="/assets/tparty/fancybox2/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />

            <!-- Optionally add helpers - button, thumbnail and/or media -->
            <link rel="stylesheet" href="/assets/tparty/fancybox2/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
            <script type="text/javascript" src="/assets/tparty/fancybox2/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
            <script type="text/javascript" src="/assets/tparty/fancybox2/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
            <link rel="stylesheet" href="/assets/tparty/fancybox2/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
            <script type="text/javascript" src="/assets/tparty/fancybox2/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>    
        {/if}
        
        <!--[if lt IE 10]>
        <div style='background: #212121; padding: 10px 0; box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3); clear: both; text-align:center; position: relative; z-index:1;'>
            <a href="http://windows.microsoft.com/en-US/internet-explorer/..">
                <img src="images/ie8-panel/warning_bar_0000_us.jpg" border="0" height="42" width="820"
                     alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
            </a>
        </div>
        <script src="/assets/js/html5shiv.js"></script>
        <![endif]-->        
    </head>

<body>
        <div class="page">
            <!--========================================================
                                      HEADER
            =========================================================-->
            <header class="header">
                <!-- RD Navbar -->
                <div style="height: 208px;" class="rd-navbar-wrap">
                    <nav style="" class="rd-navbar rd-navbar-static" data-rd-navbar-lg="rd-navbar-static">
                        <!-- RD Navbar Collapse -->
                        <div class="rd-navbar-collapse">
                            <button class="rd-navbar-collapse-toggle"><span></span></button>
                            <ul class="rd-navbar-collapse-items list">
                                <li>
                                    <span class="icon icon-xs icon-default fa-envelope"></span>
                                    <span class="rd-navbar-fixed-hidden rd-navbar-sidebar-hidden">Email:</span>
                                    <a href="mailto:#">{$baseinf["email"]}</a>
                                </li>
                                <li>
                                    <span class="rd-navbar-fixed-hidden rd-navbar-sidebar-hidden postfix-1">Позвоните нам!</span>
                                    <span class="icon icon-sm icon-default fa-mobile"></span>
                                    <a href="callto:#" class="heading-5 primary-color">{$baseinf["phone1"]}</a>
                                </li>
                            </ul>
                        </div>
                        <!-- END RD Navbar Collapse -->
                        <div class="rd-navbar-inner">
                            <!-- RD Navbar Panel -->
                            <div class="rd-navbar-panel">

                                <!-- RD Navbar Toggle -->
                                <button class="rd-navbar-toggle"><span></span></button>
                                <!-- END RD Navbar Toggle -->

                                <!-- RD Navbar Brand -->
                                <div class="rd-navbar-brand">
                                    <a href="/index.html" class="brand-name primary-color">
                                        {$baseinf["org_name"]}
                                    </a>
                                    <div class="brand-slogan">
                                        металлоизделия
                                    </div>
                                </div>
                                <!-- END RD Navbar Brand -->
                            </div>
                            <!-- END RD Navbar Panel -->


                            <!-- RD Navbar Nav -->
                            <ul class="rd-navbar-nav">
                                <li class="{if $a=="home"}active{/if}">
                                    <a href="/">Главная</a>
                                </li>
                                <li class="{if $a=="aboutus"}active{/if}">
                                    <a href="/?a=aboutus">О нас</a>
                                </li>
                                <li class="rd-navbar--has-dropdown rd-navbar-submenu {if $a=="catalog"}active{/if}">
                                    <a class="rd-navbar-submenu-link" href="/?a=catalog"><button class="rd-navbar-submenu-toggle"></button>Продукция</a>

                                    <!-- RD Navbar Megamenu -->
                                    <ul class="rd-navbar-dropdown">
                                        {section name="itm" loop=$menu}
                                            <li class="{if $menu[itm].subs>0}rd-navbar--has-dropdown rd-navbar-submenu{/if}">
                                            {if $menu[itm].subs>0}
                                                <a class="rd-navbar-submenu-link" href="/?a=catalog&id={$menu[itm].id}"><button class="rd-navbar-submenu-toggle"></button>{$menu[itm].text}</a>
                                                <ul class="rd-navbar-dropdown x-nav-sub-dropdown">
                                                {section name="sitm" loop=$menu[itm].children}
                                                    <li><a href="/?a=catalog&id={$menu[itm].children[sitm].id}">{$menu[itm].children[sitm].text}</a></li>    
                                                {/section}
                                                </ul>
                                            {else}
                                                <a href="/?a=catalog&id={$menu[itm].id}">{$menu[itm].text}</a>
                                            {/if}
                                            </li>                                            
                                        {/section}                                        
                                    </ul>
                                    <!-- END RD Navbar Megamenu -->
                                </li>
                                <li class="{if $a=="contacts"}active{/if}">
                                    <a href="/?a=contacts">Контакты</a>
                                </li>
                            </ul>
                            <!-- END RD Navbar Nav -->
                        </div>
                    </nav>
                </div>
                <!-- END RD Navbar -->
            </header>
            <!--========================================================
                                      CONTENT
            =========================================================-->
            <main class="content">