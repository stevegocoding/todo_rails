//= require jquery/dist/jquery.min
//= require jquery-validation/dist/jquery.validate.min
//= require jquery-ui/jquery-ui.min
//= require bootstrap-sass-official/assets/javascripts/bootstrap-sprockets
//= require underscore/underscore-min
//= require mustache.js/mustache.min
//= require moment/min/moment.min
//= require project
//= require task

(function(window, $, _) {
  App = (function () {
    exp = {};
    
    /** 
     * Private Functions
     */
    function onLoginSucc() {
      alert('Login Success!');
    }
    function onLoginError() {
      alert('Login Failed!');
    }

    /* 
     * Login Request 
     */
    var login = function(loginData) {
      return $.ajax({
        url: '/signin',
        type: 'POST',
        data: loginData,
        dataType: 'json'
      }); 
    }

    /*
     * Logout Request
     */
    var logout = function() { 
    }

    exp.init = function() {

      // UI Events Bindings
      $(".sidebar-tabs-section").tabs({
        active: 1
      });

      /*
      $('#signin-form').submit(function (evt) {
        evt.preventDefault(); 
        var f = $(this);

        $.when(login(f.serialize())).then(function(data) { 
          window.location.href = data.location;
          TasksController.getTasks('inbox');
        });
      });
      */

      $('#add-project-btn').click(function(evt) {
        evt.preventDefault();
        ProjectController.newForm();
      });

      $('#add-task-btn').click(function(evt) {
        evt.preventDefault();
        $('#add-task-modal').modal('show'); 
      }); 
    } 
    
    return exp;
  
  }());
  
  $(function() {
    // DOM is ready! 
    window.app = App; 
    app.init();
  });
  
}(window, window.jQuery, window._));
