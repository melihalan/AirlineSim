$(document).ajaxComplete(function(){
  if ($('#city-detail-section').is("[city_id]")){
    var $city_id = $('#city-detail-section').attr("city_id");
    $.ajax({
      url: "/hubs/hubexist",
      data: { city_id: $city_id },
      global: false,
    });
  }
});
