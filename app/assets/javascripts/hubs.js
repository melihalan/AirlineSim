$(document).ajaxComplete(function(){
  if ($('meta[name=pjs]').attr('controller') == 'hubs' && $('meta[name=pjs]').attr('action') == 'new'){
    if ($('#city-detail-section').is("[city_id]")){
      var $city_id = $('#city-detail-section').attr("city_id");
      $.ajax({
        url: "/hubs/prechecks",
        data: { city_id: $city_id },
        global: false,
      });
      $('#select-hub-button').attr("data-params", "city_id="+$city_id+"");
    }
  }else{
    return;
  }    
});
