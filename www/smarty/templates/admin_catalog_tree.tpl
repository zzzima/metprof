<form id="form-go" action="/admin/?a=editcatalog" method="post">
    <input type="hidden" name="parent_id" id="parent_id" value='0'/>
</form>
<div class="container-fluid">
    <h4>Каталог</h4>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">    
            <div class="panel panel-default">
                <div class="panel-body">
                    <button id="b_add" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Добавить категорию</button>                
                    <div class="pull-right">
                        <ol class="list-split">
                          <li><a id="expandall" href="#">Раскрыть все</a></li>
                          <li><a id="collapseall" href="#">Закрыть все</a></li>
                        </ol>
                    </div>                     
                </div>
                <div class="panel-footer">
                
                    <div id="catalog_tree">
                    </div>
                </div>
            </div>    
        </div>
    </div>    
</div>
