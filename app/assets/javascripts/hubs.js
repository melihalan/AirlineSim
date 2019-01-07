$(document).on('turbolinks:load', function(){
  $('#select-hub').prop("disabled",true)
  $('#select-hub').click(function(){
    var $city_id = $('#city-detail-section').attr("city_id")
    $.ajax({
      type: "POST",
      url: "/hubs",
      data: {
        city_id: $city_id
      }
    })
  });
});

$(document).ajaxComplete(function(){
  if ($('#city-detail-section').is("[city_id]")) {
    $('#select-hub').prop("disabled",false);
  }
  else {
    $('#select-hub').prop("disabled",true);
  }
});
