var App = App || {};
(function($) {
  App.Users = {
    init: function() {

      $('.users-list input[type=checkbox]').on('click', function(){
        var userId = $(this).data('user-id');
        console.log(userId);
        var admin = this.checked;
        $.ajax({
          url: '/users/' + userId,
          method: 'PATCH',
          data: {user: {admin: admin}}
        });        
      });
    }
  };
})(jQuery);
