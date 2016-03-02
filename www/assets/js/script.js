function include(scriptUrl) {
    document.write('<script src="' + scriptUrl + '"></script>');
}

function isIE() {
    var myNav = navigator.userAgent.toLowerCase();
    return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
};

/* cookie.JS
 ========================================================*/
include('assets/tparty/jquery/jquery.cookie.js');

/* Easing library
 ========================================================*/
include('assets/tparty/jquery/jquery.easing.1.3.js');

/* IE Fallbacks & Pollyfils
 ========================================================*/
;
(function ($) {
    if (isIE() && isIE() < 11) {
        include('assets/tparty/misc/pointer-events.js');
        $('html').addClass('lt-ie11');
        $(document).ready(function () {
            PointerEventsPolyfill.initialize({});
        });
    }

    if (isIE() && isIE() < 10) {
        $('html').addClass('lt-ie10');
    }
})(jQuery);

/* Smoothscroll 
 =============================================*/
;
(function ($) {
    if ($("html").hasClass("smoothscroll")) {
        include('assets/tparty/misc/rd-smoothscroll.js');
    }
})(jQuery);

/* WOW
 ========================================================*/
;
(function ($) {
    var o = $('html');

    if ((navigator.userAgent.toLowerCase().indexOf('msie') == -1 ) || (isIE() && isIE() > 9)) {
        if (o.hasClass('desktop') && o.hasClass("wow-animation")) {
            include('assets/tparty/misc/wow.js');

            $(document).ready(function () {
                new WOW().init();
            });
        }
    }
})(jQuery);   

/* ToTop
 ========================================================*/
;
(function ($) {
    var o = $('html');
    if (o.hasClass('desktop')) {
        include('assets/tparty/jquery/jquery.ui.totop.js');

        $(document).ready(function () {
            $().UItoTop({
                easingType: 'easeOutQuart',
                containerClass: 'ui-to-top fa fa-angle-up'
            });
        });
    }
})(jQuery); 
     
/**
 * @module       RD Mailform
 * @description  Enables RD Mailform Plugin
 */
;
/*
(function ($) {
    var o = $('.rd-mailform');
    if (o.length > 0) {
        include('assets/js/mailform/jquery.form.min.js');
        include('assets/js/mailform/jquery.rd-mailform.min.js');

        $(document).ready(function () {
            var o = $('.rd-mailform');

            if (o.length) {
                o.rdMailForm({
                    validator: {
                        'constraints': {
                            '@LettersOnly': {
                                message: 'Please use letters only!'
                            },
                            '@NumbersOnly': {
                                message: 'Please use numbers only!'
                            },
                            '@NotEmpty': {
                                message: 'Field should not be empty!'
                            },
                            '@Email': {
                                message: 'Enter valid e-mail address!'
                            },
                            '@Phone': {
                                message: 'Enter valid phone number!'
                            },
                            '@Date': {
                                message: 'Use MM/DD/YYYY format!'
                            },
                            '@SelectRequired': {
                                message: 'Please choose an option!'
                            }
                        }
                    }
                }, {
                    'MF000': 'Sent',
                    'MF001': 'Recipients are not set!',
                    'MF002': 'Form will not work locally!',
                    'MF003': 'Please, define email field in your form!',
                    'MF004': 'Please, define type of your form!',
                    'MF254': 'Something went wrong with PHPMailer!',
                    'MF255': 'There was an error submitting the form!'
                });
            }
        });
    }
})(jQuery); 
*/
/* Google Map
 ========================================================*/
;
/*(function ($) {
    var o = document.getElementById("google-map");
    if (o) {
        include('//maps.google.com/maps/api/js?sensor=false');
        include('js/jquery.rd-google-map.js');

        $(document).ready(function () {
            var o = $('#google-map');
            if (o.length > 0) {
                o.googleMap({
                    styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]
                });
            }
        });
    }
})
(jQuery);*/

/* Touch Touch Gallery
 =============================================*/
;
(function ($) {
    var o = $('.thumb');
    if (o.length > 0) {
        include('assets/tparty/jquery/jquery.touch-touch.js');

        $(document).ready(function () {
            o.touchTouch();
        });
    }
})(jQuery);

/* Responsive Tabs
 ========================================================*/
;
(function ($) {
    var o = $('.responsive-tabs');
    if (o.length > 0) {
        include('assets/tparty/jquery/jquery.responsive.tabs.js');

        $(document).ready(function () {
            o.easyResponsiveTabs();
        });
    }
})(jQuery);


/* Responsive Tabs
 ========================================================*/
;
(function ($) {
    var o = $('.rd-navbar');
    if (o.length > 0) {
        include('assets/tparty/jquery/jquery.rd-navbar.js');

        $(document).ready(function () {
            o.rdnavbar({
                stuckWidth: 768,
                stuckMorph: true,
                stuckLayout: "rd-navbar-static",
                responsive: {
                    0: ["rd-navbar-fixed"],
                    768: ["rd-navbar-fullwidth"],
                    992: ["rd-navbar-static"],
                    1200: o.attr("data-rd-navbar-lg").split(" ")
                },
                onepage: {
                    enable: false,
                    offset: 0,
                    speed: 400
                }
            });
        });
    }
})(jQuery);

/* Copyright Year
 ========================================================*/
;
(function ($) {
    var currentYear = (new Date).getFullYear();
    $(document).ready(function () {
        $("#copyright-year").text((new Date).getFullYear());
    });
})(jQuery);

/* Camera
 ========================================================*/
;
(function ($) {
    var o = $('#camera');
    if (o.length > 0) {
        if (!(isIE() && (isIE() > 9))) {
            include('assets/tparty/jquery/jquery.mobile.customized.min.js');
        }

        include('assets/tparty/misc/camera.js');

        $(document).ready(function () {
            o.camera({
                autoAdvance: true,
                //height: '' + 590 / 2050 * 100 + '%',
                //minHeight: '590px',
                height: '' + 390 / 2050 * 100 + '%',
                minHeight: '390px',                
                pagination: false,
                thumbnails: false,
                playPause: false,
                hover: false,
                loader: 'none',
                navigation: true,
                navigationHover: false,
                mobileNavHover: false,
                fx: 'simpleFade'
            })
        });
    }
})(jQuery);

/* RD Parallax
 =============================================*/
;
(function ($) {
    include('assets/tparty/jquery/jquery.rd-parallax.js');
})(jQuery);


