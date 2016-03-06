$(".thistle-value").on("click", function() {


  var id = $(this).data("id");
  $(".thistle-sources[data-id=" + id + "]").show();

  function clear() {
    $(".thistle-sources[data-id=" + id + "]").hide();
    bg.remove();
    $(document).off("keyup.thistle-" + id);
  }

  var bg = $("<div class=thistle-bg>").on("click", clear);
  $("body").append(bg);

  $(document).on("keyup.thistle-" + id, function(e) {
    if (e.keyCode == 27) {
      clear();
    }
  });

});
