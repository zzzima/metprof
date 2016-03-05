                        <!-- RD Mailform -->
                        <form action="/?a=sendrequest" method="post" class="rd-mailform111">
                            <!-- RD Mailform Type -->
                            <input type="hidden" value="contact" name="form-type">
                            <!-- END RD Mailform Type -->
                            <fieldset>
                                <div class="row preffix-1 postfix-2">
                                    <div class="col-md-4 inset-2">
                                        <label data-add-placeholder="" class="mfInput">
                                            <input type="text" data-constraints="@NotEmpty @LettersOnly" name="name">
                                            <span class="mfValidation"></span><span class="mfPlaceHolder">Имя*:</span>
                                        </label>
                                    </div>
                                    <div class="col-md-4 inset-2">
                                        <label data-add-placeholder="" class="mfInput">
                                            <input type="text" data-constraints="@NotEmpty @Email" name="email">
                                            <span class="mfValidation"></span><span class="mfPlaceHolder">E-mail*:</span>
                                        </label>
                                    </div>
                                    <div class="col-md-4 inset-2">
                                        <label data-add-placeholder="" class="mfInput">
                                            <input type="text" data-constraints="@Phone" name="phone">
                                            <span class="mfValidation"></span><span class="mfPlaceHolder">Телефон:</span>
                                        </label>
                                    </div>
                                </div>

                                <label data-add-placeholder="" class="mfInput">
                                    <textarea data-constraints="@NotEmpty" name="message"></textarea>
                                    <span class="mfValidation"></span><span class="mfPlaceHolder">Комментарий*:</span>
                                </label>

                                <div class="mfControls btn-group">
                                    <button type="submit" class="btn btn-lg btn-primary">Отправить</button>
                                </div>

                                <div class="mfInfo mfProgress"><span class="cnt"></span><span class="loader"></span><span class="msg"></span></div>
                            </fieldset>
                        </form>
                        <!-- END RD Mailform -->
                        
                        
                        <section class="well-sm-light">                                
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">
            <div class="rd-google-map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2195.363809932674!2d47.859663515486304!3d56.616414232521485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x415994acc7ddaea3%3A0x68e50d0d445e3170!2z0YPQuy4g0KHRgtGA0L7QuNGC0LXQu9C10LksIDk0LCDQmdC-0YjQutCw0YAt0J7Qu9CwLCDQoNC10YHQvy4g0JzQsNGA0LjQuSDQrdC7LCA0MjQwMDY!5e0!3m2!1sru!2sru!4v1457184322405" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>        
            </div>  
            </div>
        </div>
    </div>
</section>
                        
                        
<div>
Имя клиента: *name*
<br />
Эл. почта: *email*
<br />
Телефон: *phone*
<br />
Текст сообщения: <br />
*message*
</div>