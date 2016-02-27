<div class="container-fluid">
    <div class="row">
        <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <form role="form" id="form-base" action="/admin/?a=savepassword" method="POST">   
                        <div class="form-group">
                            <label for="f_password_old">Старый пароль <span class="label label-error"></span></label>
                            <input type="password" class="form-control" id="f_password_old" name="f_password_old" placeholder="" value="">
                        </div>                        
                        <div class="form-group">
                            <label for="f_password_new">Новый пароль <span class="label label-error"></span></label>
                            <input type="password" class="form-control" id="f_password_new" name="f_password_new" placeholder="" value="">
                        </div>
                        <div class="form-group">
                            <label for="f_password_new1">Подтвердите пароль <span class="label label-error"></span></label>
                            <input type="password" class="form-control" id="f_password_new1" name="f_password_new1" placeholder="" value="">
                        </div>                        
                        <button type="button" id="b_save" class="btn btn-primary">Сохранить</button>
                    </form>                    
                </div>
            </div>    
        </div>
    </div>
</div>
