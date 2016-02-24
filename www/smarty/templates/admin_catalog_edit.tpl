<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <h4>{if $p["id"]==0}Новый каталог{else}Каталог #{$p["id"]}{/if}</h4>
            
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <div class="panel panel-primary">
                <div class="panel-heading">Основные детали</div>
                <div class="panel-body">
                    <form role="form" id="form-base" action="/admin/?a=savecatalog" method="POST">     
                        <input type="hidden" name="f_parent_id" id="f_parent_id" value='{$p["parent_id"]}'/>
                        <input type="hidden" name="f_id" id="f_id" value='{$p["id"]}'/>                        
                        <div class="form-group">
                            <label>Родительский каталог</label>
                            <p class="bg-info">{$path}</p>
                        </div>                        
                        <div class="form-group">
                            <label for="cName">Название каталога</label>
                            <input type="text" class="form-control" id="f_name" name="f_name" placeholder="" value="{$dr.name}">
                        </div>
                        <div class="form-group">
                            <label for="catalogName">Описание</label>
                            <textarea class="form-control" id="f_descr" name="f_descr" rows="5">{$dr.descr}</textarea>
                        </div>                        
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="1" id="f_isactive" name="f_isactive" {if $dr.isactive==1}checked{/if}>       
                                Активен
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Сохранить</button>
                    </form>      
                </div>
            </div>            
        </div>
        <div class="clearfix visible-sm visible-xs"></div>
        <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12">
            <div class="panel panel-primary">
            <div class="panel-heading">Фото</div>
                <div class="panel-body">
                Загрузка изображений доступна после сохранения основных деталей
                </div>
            </div>            
        </div>
    </div>        
</div>
