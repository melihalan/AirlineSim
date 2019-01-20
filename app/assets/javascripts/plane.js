$(document).on("turbolinks:load", function(){
  $(".buy-inputs").change(function(){
    var $count = $("#plane-count").val()
    var $plane_model_id = $('#pla_mod-detail-section').attr("plane_model_id")
    $.ajax({
      url: "/planes/buy",
      data: {
        plane_model_id: $plane_model_id,
        count: $count },
      global: false,
      dataType: "script",
    });
  });
});
