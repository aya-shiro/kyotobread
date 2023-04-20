import $ from 'jquery';
window.jQuery = $; // グローバルにjQueryを使用できるようにする

$(document).on('turbolinks:load', function() {
  $(document).ready(function() {
    $('.select_search').select2();
  });
});
