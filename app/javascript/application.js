// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@hotwired/turbo-rails"
import * as jquery from "jquery"
import "semantic-ui"

$(document).on('turbo:load', function() {
  console.log('loaded turbo links')
  $('.ui.dropdown').dropdown()


  // Scrolls to bottom of chat on turbo load
  if ($('#messages').length > 0) {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }


  // Added an event listener which listens for a before-fetch turbo response to scroll to the bottom when a new message is sent
  document.addEventListener("turbo:before-fetch-response", function (e) {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  })

  $('#message_body').on('keydown', (e) => {
    if (e.key === 'Enter') {
      $('#btn').trigger('click');
      e.target.value = ""
    }
  })
  
  $('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade');
  });
});
