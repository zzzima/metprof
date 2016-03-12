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
                                                <h1>Широкий 
                                                    ассортимент
                                                    продукции</h1>
                                                <p>
                                                    Мы изготавливаем металлоизделия на заказ по типовым и индивидуальным проектам.
                                                </p>

                                                <a href="/?a=catalog" class="btn btn-xl btn-primary">Подробнее</a>
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

                                                <p>
                                                    Мы работаем только с надежными поставщиками и гарантируем качество используемых материалов.
                                                </p>

                                                <a href="/?a=catalog" class="btn btn-xl btn-primary">Подробнее</a>
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

                                                <p>
                                                    У нас большой опыт выполнения работ любой сложности. 
                                                    Вы ставите задачу - мы решаем.
                                                </p>

                                                <a href="/?a=aboutus" class="btn btn-xl btn-primary">Подробнее</a>
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
                            <a href="#">Откройте для себя надежность и эффективность изделий из металла</a>
                        </h5>
                        <p>
Металлоизделия давно и прочно вошли в повседневную жизнь, стали ее неотъемлемой частью. 
Металл - один из самых долговечных материалов, изделия из него универсальны, прочны, надежны, 
просты в обслуживании и, что немаловажно, недороги. 
Изделия из металла – это прекрасная возможность взглянуть по новому на  давно привычное. 
Помните, что создать что-то оригинальное и выделиться среди остальных возможно только тогда, когда есть из чего выбрать. 
<br>
Мы предлагаем вашему вниманию изделия на любой вкус и цвет. 
Из широкого ассортимента разноплановых металоизделий с легкостью можете создать желанную стилистику, 
необходимую в той или иной конкретной ситуации.                             
                        </p>
                        <a class="btn btn-lg btn-primary" href="/?a=catalog">Подробнее</a>
                    </div>
                    <div class="col-sm-6">
                        <h5>
                            <a href="#">Меньше слов больше дела. Наша квалификация и опыт работают на вас.
                            </a>
                        </h5>
                        <p>
При производстве мы используем современные технологии, которые позволяют быстро и точно исполнить заказ любой сложности.
Мы хотим и умеем работать. Квалификация наших специалистов является гарантией точности исполнения требований заказчика, 
а четко налаженная работа обеспечивает безукоризненное соблюдение оговоренных сроков выполнения заказа. 
<br>
Контроль производственного процесса на всех его этапах и грамотный подбор материалов в зависимости от требований 
к конструкции изделий и их характеристикам позволяют обеспечить высокое качество и безупречный внешний вид наших 
металлоконструкций и металлоизделий.                            
                        </p>
                        <a class="btn btn-lg btn-primary" href="/?a=aboutus">Подробнее</a>
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
                                <a href="#">Надежность и долговечность конструкций</a>
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