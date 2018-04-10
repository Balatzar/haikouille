$(document).ready(function() {
  var modal = $("#createHaikouille");

  var btn = $("#showModal");

  var close = $("#close");

  btn.click(function() {
    modal.css("display", "block");
  });

  close.click(function() {
    modal.css("display", "none");
  });

  $(window).click(function(event) {
    if (event.target.id == modal.attr("id")) {
      modal.css("display", "none");
    }
  });

  $("#masonry-container").masonry({
    itemSelector: ".haikouille",
    gutterWidth: 40,
    isFitWidth: true
  });
});

$(document).on("submit", "#new_haikouille", function(e) {
  var $form;
  var valid = true;
  var haikouille = "";
  e.preventDefault();
  $form = $(this);
  $(".js-error").remove();
  $(".js-paragraph").each(function(i, paragraph) {
    var inputVal = $(paragraph).val();
    haikouille += " " + inputVal;
    var syllables = syllable(inputVal);
    if (syllables < 4 || syllables > 8) {
      valid = false;
      $(paragraph).after(
        "<span class='js-error'>" +
          syllables +
          " syllabes (la forme classique du haikouille est 5/7/5</span>"
      );
    }
  });
  if (haikouille.toLowerCase().indexOf("couille") < 0) {
    valid = false;
    $("[type='submit']").before(
      "<p class='js-error'>le haikouille doit contenir le mot couille au singulier ou au pluriel</p>"
    );
  }
  if (!$("#haikouille_title").val()) {
    valid = false;
    $("#haikouille_title").after(
      "<span class='js-error'>un joli titre est requis</span>"
    );
  }
  if (!valid) return;
  $.post($form.attr("action"), $form.serializeArray(), function(html) {
    $(".haikouille:last").after(html);
    $("#createHaikouille").css("display", "none");
  });
});
