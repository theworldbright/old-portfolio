<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Kent Shikama</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:javascript>
        window.grailsSupport = {
            assetsRoot : '${raw(asset.assetPath(src: ''))}'
        };
    </g:javascript>
</head>

<body>
<div id="work-in-progress">
    <div id="spinner">
        <g:img uri="${resource(dir: "images", file: "ajax-loader.gif")}" alt="Loading..."/>
    </div>
</div>
<section class="gallery" id="container" itemscope itemtype="http://schema.org/ImageGallery">
    <div class="item" id="titleItem">
        <div id="titleBox">
            <h1 id="kentshikama">Kent Shikama</h1>
            <nav class="titleNavigation">
                <div id="allNavigation" onclick="allNavigation();" class="activeNavigation">All</div>
                <div id="imageNavigation" onclick="imageNavigation();">Photography/Illustrations</div>
                <div id="htmlNavigation" onclick="htmlNavigation();">Web/Software Development</div>
            </nav>
        </div>
    </div>
    <figure class="item htmlFigure" id="numbercortex">
        <div style="display: none">
            <div style="color: #FFF;" class="vertical-center">
                <div>
                    <a href="http://www.numbercortex.com">
                        <img src="http://www.numbercortex.com/facebook_images/number_cortex_2.jpg" alt="Number Cortex Desktop Banner"/>
                    </a>
                    <div style="margin: 40px;"></div>

                    <p style="font-size: 150%;">Number Cortex is a three month project that I mostly completed over the summer of 2014.
                    I designed and developed the board game app using Photoshop, Libgdx (Cross-platform Java Game Development Framework), Freetype, and Bfxr. For more information see <a
                            href="http://www.numbercortex.com"
                            style="color: #FFF;">the Number Cortex official website</a>.</p>
                </div>
            </div>
        </div>
        <a href="http://numbercortex.com/images/number_cortex_mobile_banner_400.jpg" itemprop="contentUrl">
            <img class="thumbnail" itemprop="thumbnail"
                 src="http://numbercortex.com/images/number_cortex_mobile_banner_400.jpg" alt="Number Cortex Mobile Banner" width="400"/>
        </a>
    </figure>
    <g:each var="imageObject" in="${imageFigureList}">
        <figure class="item imageFigure" itemscope itemtype="http://schema.org/ImageObject">
            <a href="${resource(dir: '/', file: imageObject.imageURL)}" itemprop="contentUrl" data-size="${imageObject.width}x${imageObject.height}">
                <img class="thumbnail" itemprop="thumbnail" src="${resource(dir: '/', file: imageObject.thumbnailURL)}" alt="${imageObject.alt} image" width="400"/>
            </a>
        </figure>
    </g:each>
</section>
<footer>Copyright © 2015 Kent Shikama. All rights reserved.</footer>
<!-- Root element of PhotoSwipe. Must have class pswp. -->
<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

    <!-- Background of PhotoSwipe.
         It's a separate element, as animating opacity is faster than rgba(). -->
    <div class="pswp__bg"></div>

    <!-- Slides wrapper with overflow:hidden. -->
    <div class="pswp__scroll-wrap">

        <!-- Container that holds slides.
            PhotoSwipe keeps only 3 of them in DOM to save memory.
            Don't modify these 3 pswp__item elements, data is added later on. -->
        <div class="pswp__container">
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
        </div>

        <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
        <div class="pswp__ui pswp__ui--hidden">

            <div class="pswp__top-bar">

                <!--  Controls are self-explanatory. Order can be changed. -->

                <div class="pswp__counter"></div>

                <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

                <button class="pswp__button pswp__button--share" title="Share"></button>

                <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>

                <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

                <!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
                <!-- element will get class pswp__preloader--active when preloader is running -->
                <div class="pswp__preloader">
                    <div class="pswp__preloader__icn">
                        <div class="pswp__preloader__cut">
                            <div class="pswp__preloader__donut"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip"></div>
            </div>

            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
            </button>

            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
            </button>

            <div class="pswp__caption">
                <div class="pswp__caption__center"></div>
            </div>

        </div>

    </div>

</div>
</body>
</html>