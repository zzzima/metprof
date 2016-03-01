    <!-- The file upload form used as target for the file upload widget -->
    <form id="fileupload" action="//jquery-file-upload.appspot.com/" method="POST" enctype="multipart/form-data">
        <!-- Redirect browsers with JavaScript disabled to the origin page -->
        <!--noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript-->
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="row fileupload-buttonbar">
            <div class="col-lg-12">               
                <!-- The fileinput-button span is used to style the file input field as button -->
                <span class="btn btn-success fileinput-button fileinput-main">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>Добавить главное фото</span>
                    <input type="file" name="mainfiles[]">
                    <!--input type="file" name="files[]"-->
                </span>                
                <!-- The fileinput-button span is used to style the file input field as button -->
                <span class="btn btn-success fileinput-button fileinput-galery">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>Добавить фото</span>
                    <input type="file" name="files[]" multiple>
                    <!--input type="file" name="files[]"-->
                </span>
                <button type="submit" class="btn btn-primary start">
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Начать загрузку</span>
                </button>
                <button type="reset" class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Отменить загрузку</span>
                </button>
                <button type="button" class="btn btn-danger delete">
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Удалить</span>
                </button>
                <input type="checkbox" class="toggle">
                <!-- The global file processing state -->
                <span class="fileupload-process"></span>
            </div>
            <!-- The global progress state -->
            <div class="col-lg-5 fileupload-progress fade">
                <!-- The global progress bar -->
                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                </div>
                <!-- The extended global progress state -->
                <div class="progress-extended">&nbsp;</div>
            </div>
        </div>
        <!-- The table listing the files available for upload/download -->
        <!--table role="presentation" class="table table-striped"><tbody class="files"></tbody></table-->
        <table role="presentation" class="table"><tbody class="files"></tbody></table>
    </form>
</div>
<!-- The blueimp Gallery widget -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{literal}    
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload {% if(file.is_main==1) { %}row-ismain{% } %} fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            {% if(file.is_main==1) { %}
            <span class="label label-danger label-ismain">Главное фото</span>
            {% } %}
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Обработка...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Загрузить</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Отменить</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
{/literal}    
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{literal}        
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download {% if(file.is_main==1) { %}row-ismain{% } %} fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            {% if(file.is_main==1) { %}
            <span class="label label-danger label-ismain">Главное фото</span>
            {% } %}
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Удалить</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Отменить</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
{/literal}
</script>
<!--script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script-->
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="/plugins/jqfileupload/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="/assets/tparty/blueimp/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="/assets/tparty/blueimp/js/load-image.all.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="/assets/tparty/blueimp/js/canvas-to-blob.min.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<!--script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script-->
<!-- blueimp Gallery script -->
<script src="/assets/tparty/blueimp/js/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="/plugins/jqfileupload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="/plugins/jqfileupload/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="/plugins/jqfileupload/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="/plugins/jqfileupload/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="/plugins/jqfileupload/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="/plugins/jqfileupload/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="/plugins/jqfileupload/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="/plugins/jqfileupload/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<script src="/plugins/jqfileupload/js/main.js"></script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="/plugins/jqfileupload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
