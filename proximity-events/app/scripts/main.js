'use strict';

window.freezeframe_options = {
    loading_background_color: 'white',
    animation_icon_image: false,
    trigger_event: 'click'
};   

// to cancel click/hover event on gif
$('div').click(function() {
    $('figure.freezeframe-container', this).find('img.freezeframe_done').css('opacity', 0);
});

window.addEventListener('deviceproximity', function(event) {
    if(event.value <= 7) {
      $('.freezeframe_done').css('opacity', 1);
    } else {
      $('.freezeframe_done').css('opacity', 0);
    }
});    

