(function (w, d) {

    w.WebFontConfig = {
        google: { families: [ 'Salsa', 'Open Sans', 'Inconsolata' ] }
    };

    var wf = d.createElement('script');
    wf.src = ('https:' == d.location.protocol ? 'https' : 'http') +
        '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';

    var s = d.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);

})(window, document);
