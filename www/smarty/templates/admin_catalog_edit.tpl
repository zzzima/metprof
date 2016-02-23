<form id="form-go" action="/admin/?a=savecatalog" method="post">
    <input type="hidden" name="parent_id" id="parent_id" value='{$parent_id}'/>
    <input type="hidden" name="catalog_id" id="catalog_id" value='{$catalog_id}'/>
</form>
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <h4>{if $catalog_id==0}Каталог #{$catalog_id}{else}Новый каталог{/if}</h4>
        </div>
    </div>
</div>
