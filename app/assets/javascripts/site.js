$(document).on('turbolinks:load', function() {
    refreshRating();

    $('.img-zoom').elevateZoom({
      zoomType: "lens", 
      lensShape : "round", 
      lensSize: 200
    });
});

function refreshRating () {
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });

  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
    return $(this).attr('data-score');}
  });
}