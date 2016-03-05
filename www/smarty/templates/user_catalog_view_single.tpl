        <!-- Products -->
        <section class="well-sm x-product-descr">
            <div class="container">
                <h1>
                    {$dr_c.name}
                </h1>
                <div class="row flow-offset-1">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="media">
                          <div class="pull-left thumbnail"><img class="media-object" src="{$dr_c.filepath}" alt="{$dr_c.name}"></div>
                          <div class="media-body">
                            {$dr_c.descr}
                          </div>
                        </div>                          
                    </div>                               
                </div>
            </div>
        </section>
        <!-- END Products -->

        <!-- What we offer -->
        <section class="bg-light well-sm x-galery">
            <div class="container">
                <h1>Наши работы</h1>
                <div class="row">
                  {section name="ifl" loop=$dt_f}  
                  <div class="col-lg-2 col-md-4 col-sm-6 col-xs-12">
                    <div class="thumbnail">
                        <div class="x-mosaic">
                        <a href="{$cat_file_url}{$dt_f[ifl].filename}" rel="galery">
                            <img src="{$cat_file_url}small/{$dt_f[ifl].filename}" alt="{$dr_c.name}">
                        </a>
                        </div>
                    </div>
                  </div>
                  {/section}
                </div>

            </div>
        </section>
        <!-- END What we offer-->
