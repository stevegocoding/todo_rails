(function($, _) {
  ProjectController = (function() {
    return {
      getProjects: function() {
        $.ajax({
          url: 'projects',
          type: 'GET',
          dataType: 'JSON'
        })
        .done(function(projects) {

        })
        .fail(function() {
        }); 
      },

      newForm: function() {
      }
    };
  }())
}(window.jQuery, window._));

