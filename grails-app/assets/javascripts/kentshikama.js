docReady( function() {
    var $container = $('#container');
    // initialize Masonry after all images have loaded
    $container.imagesLoaded(
        function() {
            $container.masonry({
                itemSelector: '.item',
                isFitWidth: true
            });
        }
    );
});