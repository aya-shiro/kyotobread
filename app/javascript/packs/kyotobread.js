// import $ from 'jquery';
// window.jQuery = $; // グローバルにjQueryを使用できるようにする

// $('#tab-contents .tab[id != "tab1"]').hide();
$(document).on('turbolinks:load', function() {
  $(document).ready(function () {
    $('#tab-contents .tab[id != "tab1"]').hide();

    $('#tab-menu a').on('click', function(event) {
      $("#tab-contents .tab").hide();
      $("#tab-menu .active").removeClass("active");
      $(this).addClass("active");
      $($(this).attr("href")).show();
      event.preventDefault();
    });
  });
});


// $(document).ready(function () {
//   $('body').html('<h1>Hello jQuery!!</h1>');
// });