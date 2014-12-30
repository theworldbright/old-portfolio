<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Kent Shikama</title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:javascript>
        window.grailsSupport = {
            assetsRoot : '${ raw(asset.assetPath(src: '')) }'
        };
    </g:javascript>
</head>

<body>
<section class="gallery" id="container" itemscope itemtype="http://schema.org/ImageGallery">
    <div class="item" id="titleItem">
        <div id="titleBox">
            <h1 id="kentshikama">Kent Shikama</h1>
            <p class="titleSmallText">Photography/Illustrations</p>
            <p class="titleSmallText">Game/Web Development</p>
        </div>
    </div>
    <div class="item slider" id="numbercortex"><h1>Number Cortex</h1><a href="http://www.numbercortex.com">Play the board game on the iOS and Android</a></div>
    <figure class="item slider" id="image1" itemscope itemtype="http://schema.org/ImageObject">
        <a href="${resource(dir:"images", file: "abstractshrimp.jpg") }" itemprop="contentUrl" data-size="1600x1200">
            <asset:image class="thumbnail" itemprop="thumbnail" src="abstractshrimp.jpg" width="400"/>
        </a>
    </figure>
    <figure class="item slider" id="image2" itemscope itemtype="http://schema.org/ImageObject">
        <a href="${resource(dir:"images", file: "butterfly.jpg") }" itemprop="contentUrl" data-size="1600x813">
            <asset:image class="thumbnail" itemprop="thumbnail" src="butterfly.jpg"  width="400"/>
        </a>
    </figure>
    <figure class="item slider" id="image3" itemscope itemtype="http://schema.org/ImageObject">
        <a href="${resource(dir:"images", file: "colorfulbird.jpg") }" itemprop="contentUrl" data-size="1600x1067">
            <asset:image class="thumbnail" itemprop="thumbnail" src="colorfulbird.jpg"  width="400"/>
        </a>
    </figure>
    <figure class="item slider" id="image4" itemscope itemtype="http://schema.org/ImageObject">
        <a href="${resource(dir:"images", file: "dragonfly.jpg") }" itemprop="contentUrl" data-size="1600x900">
            <asset:image class="thumbnail" itemprop="thumbnail" src="dragonfly.jpg"  width="400"/>
        </a>
    </figure>
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