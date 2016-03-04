        <!-- Products -->
        <section class="well-sm">
            <div class="container">
                <h1>
                    Продукция
                </h1>
                <div class="row flow-offset-1">
                    {section name=i loop=$dt_c}
                        {include file="user_inc_cat.tpl" dr=$dt_c[i]}
                    {/section}
                </div>
            </div>
        </section>
        <!-- END Products -->

        <!-- What we offer -->
        <section class="bg-light well-sm">
            <div class="container">
                <h1>Что мы предлагаем</h1>

                <div class="row">
                    <div class="col-sm-6">
                        <ul class="marked-list">
                            <li>
                                <a href="#">Производство металлоизделий любой сложности</a>
                            </li>
                            <li>
                                <a href="#">Монтаж и последующее обслуживание</a>
                            </li>
                            <li>
                                <a href="#">Гибкая ценовая политика</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <ul class="marked-list">
                            <li>
                                <a href="#">Рубку, резку и раскрой листовых материалов</a>
                            </li>
                            <li>
                                <a href="#">Фрезерные и токарные работы</a>
                            </li>
                            <li>
                                <a href="#">Разные виды сварочных работ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- END What we offer-->

        <!-- Featured products -->
        <section class="well-sm bg-secondary">
            <div class="container">
                <h1>Популярные продукты</h1>

                <div class="row flow-offset-1">
                    {section name=i1 loop=$dt_rc}
                        <div class="col-sm-4">
                            <h5>
                                <a href="/?a=catalog&id={$dt_rc[i1].id}">{$dt_rc[i1].name}</a>
                            </h5>
                            <p>
                                {$dt_rc[i1].descr}
                            </p>
                            <a href="/?a=catalog&id={$dt_rc[i1].id}" class="link">Подробнее</a>
                        </div>                        
                    {/section}
                    
                    <!--div class="col-sm-4">
                        <h5>
                            <a href="#">Металлические двери</a>
                        </h5>
                        <p>
                            Оптически наблюдать объекты нельзя решить какой. Попыток отождествления галактических 
                            дискретных источников. Между облаками пылевой материи после вспышек новых и следовало ожидать. 
                            Оказались в радиоизлучений доходит беспрепятственно высокими температурами, а слабых галактик 
                            явля­лась источником.
                        </p>
                        <a href="#" class="link">Подробнее</a>
                    </div>
                    <div class="col-sm-4">
                        <h5>
                            <a href="#">Заборы</a>
                        </h5>
                        <p>
                            Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. 
                            Все действующие точечные радиоисточники слились. К галактическому экватору света очень
                            много усилий излучение будет все-таки. Оказались в радиоизлучений доходит 
                            беспрепятственно высокими температурами
                        </p>
                        <a href="#" class="link">Подробнее</a>
                    </div>
                    <div class="col-sm-4">
                        <h5>
                            <a href="#">Теплицы</a>
                        </h5>
                        <p>
                            В окнах видимости между облаками пылевой материи после вспышек новых и остатками. 
                            Разрабатывались методы определения их радиоизлучение доходит беспрепятственно ожидать. 
                            Температурами, а слабых галактик не об­наруживают галактической концентрации этих галактик являлась источником.
                        </p>
                        <a href="#" class="link">Подробнее</a>
                    </div-->
                </div>
            </div>
        </section>
        <!-- END Featured products-->