var refreshRating = function() {
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
};

$(document).on('turbolinks:load ajaxSuccess', function(){
  refreshRating();

  $('.img_zoom').ezPlus({
    zoomType: "lens",
    lensShape : "round",
    lensSize    : 200
  });
});
