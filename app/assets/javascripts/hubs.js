$(document).on("turbolinks:load", function(){
  if ($('meta[name=pjs]').attr('controller') == 'hubs' && $('meta[name=pjs]').attr('action') == 'show'){
    var $city_id = $('#city-detail-section').attr("city_id")
    $.ajax({
      url: "/hubs/updatechecks",
      data: { city_id: $city_id },
      global: false,
    });
  }
});
