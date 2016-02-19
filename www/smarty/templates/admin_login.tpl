{include file="admin_header.tpl"}    
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-md-3 col-sm-12 col-xs-12"></div>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            {if $err|strlen > 0}
            <div class="alert alert-danger">{$err}</div>            
            {/if}
            <form role="form" action="login.php" method="post">
                <div class="form-group">
                    <label for="username">Логин</label>
                    <input type="username" class="form-control" id="username" name="username" placeholder="Введите логин" value="{$username}">
                </div>
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Введите пароль">
                </div>
                <button type="submit" class="btn btn-primary">Войти</button>
            </form>
        </div>
        <div class="col-lg-4 col-md-3 col-sm-12 col-xs-12"></div>
    </div>
</div>
{include file="admin_footer.tpl"}
