docReady(function () {
    var $container = $('#container');
    // initialize Masonry after all images have loaded
    $container.imagesLoaded(
        function () {
            $container.masonry({
                itemSelector: '.item',
                isFitWidth: true
            });
        }
    );
});

function displayAllItems() {
    var allItems = document.querySelectorAll('.contentItem');
    for (i = 0; i < allItems.length; i++) {
        allItems[i].style.display = 'block';
    }
}
function allNavigation() {
    displayAllItems();
    $('#container').masonry();
    $('.titleNavigation').children().removeClass('activeNavigation');
    $('#allNavigation').addClass('activeNavigation');
}
function imageNavigation() {
    displayAllItems();
    var htmlItems = document.querySelectorAll('.htmlFigure');
    for (i = 0; i < htmlItems.length; i++) {
        htmlItems[i].style.display = 'none';
    }
    $('#container').masonry();
    $('.titleNavigation').children().removeClass('activeNavigation');
    $('#imageNavigation').addClass('activeNavigation');
}
function htmlNavigation() {
    displayAllItems();
    var imageItems = document.querySelectorAll('.imageFigure');
    for (i = 0; i < imageItems.length; i++) {
        imageItems[i].style.display = 'none';
    }
    $('#container').masonry();
    $('.titleNavigation').children().removeClass('activeNavigation');
    $('#htmlNavigation').addClass('activeNavigation');
}
function toggleAbout() {
    $('#aboutItem').fadeToggle(100, function () {
        if ($('#aboutNavigation').text() === "Show About") {
            $('#aboutNavigation').text("Hide About");
        } else {
            $('#aboutNavigation').text("Show About");
        }
        $('#container').masonry();
    });
}
$(window).bind("load", function () {
    $('#work-in-progress').fadeOut(100);
});