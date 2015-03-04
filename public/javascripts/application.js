$( document ).ready(function() {

  $( '#register' ).on('click',function(event) {
    event.preventDefault();

    $.ajax({
      url: '/register.json',
      success: function(result) {
        console.log(result);
        $('div#registration-form').html(result);
        $('button#register').toggle();
      }
    });
  });

  $( '#registration-form' ).on('submit', '#reg', function(event) {
    event.preventDefault();
    var data = $(this).serialize();

    console.log(data);

    $.ajax({
      type: 'post',
      url: '/register.json',
      data: data,
      success: function(result) {
        $('div#registration-form').html(result);
      },
      error: function(result) {
        $('div#registration-form').html(result);
      }
    });
  });




});
