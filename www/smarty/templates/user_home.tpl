                <section class="well-xs">
                    <!-- Camera -->
                    <div class="camera_container">
                        <div class="camera_wrap" id="camera">
                            <!--div data-src="assets/images/page-1_img01.jpg"-->
                            <div data-src="assets/images/slider012.jpg">
                                <div class="camera_caption fadeIn">
                                    <div class="container text-center text-md-right">
                                        <div class="row">
                                            <div class="col-md-6 col-md-preffix-6 col-lg-4 bg-secondary skew-right col-lg-preffix-8 well-md">
                                                <h1>Большой 
                                                    ассортимент
                                                    продукции</h1>

                                                <p>Душа моя озарена неземной радостью, как эти чудесные весенние утра, 
                                                    которыми я наслаждаюсь.
                                                </p>

                                                <a href="#" class="btn btn-xl btn-primary">Подробнее</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--div data-src="assets/images/page-1_img02.jpg"-->
                            <div data-src="assets/images/slider021.jpg">
                                <div class="camera_caption fadeIn">
                                    <div class="container text-center text-md-right">
                                        <div class="row">
                                            <div class="col-md-6 col-md-preffix-6 col-lg-4 bg-secondary skew-right col-lg-preffix-8 well-md">
                                                <h1>Качественные
                                                    и проверенные 
                                                    материалы</h1>

                                                <p>Я совсем один и блаженствую в здешнем краю, словно созданном для таких, как я..</p>

                                                <a href="#" class="btn btn-xl btn-primary">Подробнее</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--div data-src="assets/images/page-1_img03.jpg"-->
                            <div data-src="assets/images/slider03.jpg">
                                <div class="camera_caption fadeIn">
                                    <div class="container text-center text-md-right">
                                        <div class="row">
                                            <div class="col-md-6 col-md-preffix-6 col-lg-4 col-lg-preffix-8 bg-secondary skew-right well-md">
                                                <h1>Квалифицированные
                                                    и опытные
                                                    специалисты</h1>

                                                <p>Я так счастлив, мой друг, так упоен ощущением покоя, что искусство мое 
                                                    страдает от этого.</p>

                                                <a href="#" class="btn btn-xl btn-primary">Подробнее</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END Camera -->
                    
               <div class="container">
                <div class="row flow-offset-1">
                    {section name=i loop=$dt_c}
                        {include file="user_inc_cat.tpl" dr=$dt_c[i]}
                    {/section}  
                </div>
            </div>                    
                </section>
                
        <!-- Stocking, processing, and delivering steel products -->
        <section class="bg-light well-sm">
            <div class="container">
                <h1>
                    Производство, доставка <br>
                    и монтаж металлоизделий
                </h1>

                <div class="row">
                    <div class="col-sm-6">
                        <h5>
                            <a href="#">Даже всемогущая пунктуация не имеет власти над рыбными текстами.</a>
                        </h5>
                        <p>Повседневная практика показывает, что укрепление и развитие структуры представляет 
                            собой интересный эксперимент проверки форм развития. 
                            Постоянный количественный рост и сфера нашей активности способствует 
                            подготовки и реализации позиций, занимаемых участниками в отношении поставленных задач. 
                            Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию 
                            позиции влечет за собой процесс внедрения и модернизации дальнейших направлений развития. 
                            Значимость этих проблем настолько очевидна, что постоянный количественный рост и сфера нашей 
                            активности играет важную роль в формировании систем массового участия.</p>
                        <a class="btn btn-lg btn-primary" href="#">Подробнее</a>
                    </div>
                    <div class="col-sm-6">
                        <h5>
                            <a href="#">Меньше слов больше дела. Наша квалификация и опыт работают на вас.
                            </a>
                        </h5>
                        <p>Равным образом постоянное информационно-пропагандистское обеспечение нашей 
                            деятельности позволяет выполнять важные задания по разработке форм развития. 
                            Не следует, однако забывать, что рамки и место обучения кадров представляет 
                            собой интересный эксперимент проверки направлений прогрессивного развития. 
                            Разнообразный и богатый опыт постоянный количественный рост и сфера нашей 
                            активности влечет за собой процесс внедрения и модернизации соответствующий 
                            условий активизации. Разнообразный и богатый опыт постоянный количественный рост и сфера нашей 
                            активности влечет за собой процесс внедрения и модернизации соответствующий 
                            условий активизации.</p>
                        <a class="btn btn-lg btn-primary" href="#">Подробнее</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- END Stocking, processing, and delivering steel products-->   
        <!-- Our quality products include -->
        <section class="well-xs text-center text-sm-left">
            <div class="container">
                <h1>Наши преимущества: </h1>

                <div class="row flow-offset-1">
                    <div class="col-sm-2 col-lg-6">
                        <!-- Marked List -->
                        <ul class="marked-list">
                            <li>
                                <a href="#">Приемлемые цены</a>
                            </li>
                            <li>
                                <a href="#">Широкий ассортимент продукции</a>                                
                            </li>
                            <li>
                                <a href="#">Надежность и безопасность конструкций</a>
                            </li>
                            <li>
                                <a href="#">Качественный монтаж в короткие сроки</a>
                            </li>
                        </ul>                        
                        <!-- END Marked List -->
                    </div>
                    <div class="col-sm-2 col-lg-6">
                        <!-- Marked List -->
                        <ul class="marked-list">
                            <li>
                                <a href="#">Высокий уровень проектных работ</a>
                            </li>
                            <li>
                                <a href="#">Строгий контроль качества на каждом этапе</a>
                            </li>
                            <li>
                                <a href="#">Высококвалифицированные специалисты</a>
                            </li>
                            <li>
                                <a href="#">Ответственность и серьёзный подход к делу</a>
                            </li>
                        </ul>
                        <!-- END Marked List -->
                    </div>
                </div>
            </div>
        </section>
        <!-- END Our quality products include-->  
        <!-- Our Contacts -->
        {include file="user_inc_contacts.tpl"}
        <!-- END Our Contacts-->  