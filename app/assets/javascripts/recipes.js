$(document).ready(function(){
  $(".add-ingredient").on("click", function(e){
    e.preventDefault();
    $.ajax({
      url: '/recipes/new/ingredient',
      type: 'get'
    })

    .done(function(response){
      console.log(response);
      $(".new-ingredient").append(response);
    });
  });
});
