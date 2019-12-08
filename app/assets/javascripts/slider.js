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