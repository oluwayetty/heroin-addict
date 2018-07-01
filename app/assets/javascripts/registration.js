var App = App || {};
(function($) {
  App.Registration = {
    init: function() {
      var section = $('#form-group-addict-usernames');
      $('#user_supporter_false').on('click', function(){
        section.hide();
        section.find('input[type=text]').val('');
      });

      $('#user_supporter_true').on('click', function(){
        section.show();
      });
    }
  };
})(jQuery);
