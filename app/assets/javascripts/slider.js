// 商品詳細ページ
$(function() {
  $('.slider').slick({
    dots:true,
    customPaging: function(slick,index) {
      var targetImage = slick.$slides.eq(index).find('img').attr('src');
      return '<img src=" ' + targetImage + ' "/>';
    }
  });
  $( '.slider' ).on( 'mouseenter', '.slick-dots > li', function() {
    $( this ).click();
  });
  $( '.slider' ).on( 'mouseover', '.slick-dots > li', function() {
    $( this ).css({
      opacity: "1",
      cursor: "pointer"
      
    });
  });
  $( '.slider' ).on( 'mouseout', '.slick-dots > li', function() {
    $( this ).css({
      opacity: "",
      cursor: ""
    });
  });
});

// トップビューページ
$(function() {
  $('.center-item').slick({
        infinite: true,
        dots:true,
        slidesToShow: 1,
        centerMode: true, 
        centerPadding:'100px',
        autoplay:false,
        responsive: [{
             breakpoint: 480,
                  settings: {
                       centerMode: false,
             }
        }]
   });
});