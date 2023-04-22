import $ from 'jquery';
window.jQuery = $; // グローバルにjQueryを使用できるようにする

$(document).on('turbolinks:load', function() {
  $(function() {
    // トップページの場合のみjscrollを有効にする
    if ($('.top-page').length > 0) {
      $('.pagination').hide();
      $(window).scroll(function() {
        var url = $('.pagination .next_page').attr('href');
        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
          $('.pagination').text('Loading more...');
          return $.getScript(url);
        }
      });
      return $(window).scroll();
    }
  });
});