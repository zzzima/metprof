<div id="helper"></div>
<div class="container-fluid">
    <h4>{if $p["id"]==0}Новый товар{else}Товар #{$p["id"]} ({$dr.name}){/if}</h4> 
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" id="editTab">
              <li class="active"><a href="#home" data-toggle="tab">Главная</a></li>
              <li><a href="#photo" data-toggle="tab">Фото</a></li>
            </ul>

            <!-- Tab panes --> 
            <div class="tab-content">
                <div class="tab-pane active" id="home">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <button type="button" id="b_save" class="btn btn-primary">Сохранить</button>   
                            <button type="button" id="b_back" class="btn btn-default">Вернуться в каталог</button>                     
                        </div> 
                        <div class="panel-body"> 
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">Основные детали</div>
                                        <div class="panel-body">
                                            <form role="form" id="form-base" action="/admin/?a=saveware" method="POST">     
                                                <input type="hidden" name="f_parent_id" id="f_parent_id" value='{$p["parent_id"]}'>
                                                <input type="hidden" name="f_id" id="f_id" value='{$p["id"]}'/>                                                
                                                <div class="form-group">
                                                    <label for="f_name">Наименование <span class="label label-error"></span></label>
                                                    <input type="text" class="form-control" id="f_name" name="f_name" placeholder="" value="{$dr.name}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="f_descr">Описание <span class="label label-error"></span></label>
                                                    <textarea class="form-control" id="f_descr" name="f_descr" rows="7">{$dr.descr}</textarea>
                                                </div>                        
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value="1" id="f_isactive" name="f_isactive" {if $dr.isactive==1}checked{/if}>       
                                                        Активен
                                                    </label>
                                                </div>                                                
                                            </form>      
                                        </div>
                                    </div>            
                                </div>
                                <div class="clearfix visible-sm visible-xs">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">Размещение каталоге</div>
                                        <div class="panel-body">
                                            <div class="pull-right">
                                                <ol class="list-split">
                                                  <li><a id="expandall" href="#">Раскрыть все</a></li>
                                                  <li><a id="collapseall" href="#">Закрыть все</a></li>
                                                </ol>
                                            </div>
                                            <div class="clearfix"></div>      

                                            <span id="err_parent_id" class="label label-error"></span>
                                            <div id="catalog_tree">
                                            </div>                    
                                        </div>        
                                    </div>            
                                </div>
                             </div>
                         </div>
                    </div>
                </div>
                <div class="tab-pane" id="photo">
                    <div class="panel panel-default">
                        <div class="panel-body">       
                            <div class="row"> 
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="panel panel-primary">
                                    <div class="panel-heading">Фото</div>
                                        <div class="panel-body">
                                        {if $p["id"]==0}
                                        Загрузка изображений доступна после сохранения основных деталей
                                        {else}
                                        <input type="hidden" id="f_uploadtype" value="ware">                
                                        {include file="admin_inc_fileupload.tpl"}
                                        {/if}
                                        </div>
                                    </div>            
                                </div>                                
                            </div>
                        </div>               
                    </div>
                </div>  
            </div>            
        </div>
    </div>       
</div>   
