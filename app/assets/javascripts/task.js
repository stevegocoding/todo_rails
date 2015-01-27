(function($, _) { 
  Task = {
    init: function() {
      this.desc = ""; 
      this.dueDate = ""; 
    }, 

    setDesc: function(desc) {
      this.desc = desc; 
    }, 

    setDueDate: function(dueDate) {
      this.dueDate = dueDate;
    },

    getDesc: function() {
      return this.desc; 
    },

    getDueDate: function () {
      return this.dueDate;
    },
  }; 
  
  TaskFactory = (function() { 
    return {
      create: function(data) { 
        var newTask = Object.create(Task);
        newTask.setDesc(data['desc']);
        newTask.setDueDate(data['due_date']); 
        return newTask;
      }
    }
  }());
  
  TasksController = (function() {
    exp = {}; 

    exp.groupTasksByDueDate = function(tasks) {
      var groups = _.groupBy(tasks, function(t) {
        return t.getDueDate();
      });
      return groups;
    }

    exp.render = function(task) {
      return Mustache.to_html($('#task-template').html(), task);
    }

    exp.refreshTasksCache = function(tasksData) {
      if (this.tasks === undefined) {
        this.tasks = [];
      }

      this.tasks.length = 0;
      
      var i = 0; 
      var that = this;
      _.each(tasksData, function(td) {
        that.tasks[i]= TaskFactory.create(td);
        i++;
      });
    }

    exp.getTasks = function(filter) { 
        var that = this; 
        $.ajax({
          url: 'tasks/filtered',
          type: 'GET',
          data: {'filter_id': filter},
          dataType: 'JSON'
        })
        .done(function(tasksData) {
          that.refreshTasksCache(tasksData);
          that.refreshView(); 
        })
        .fail(function() {
          // error handling
          alert('getTasks - failed!');
        });
      }; 

      exp.refreshView = function() {
        var that = this;
        var tasksDays = this.groupTasksByDueDate(this.tasks);

        var taskContainerDiv = $('#tasks-container');
        console.log(tasksDays);
        _.each(tasksDays, function(tasks, date, map) {
          var dom = '<h2>' + date + '</h2>'; 
          taskContainerDiv.append(dom);
          _.each(tasks, function(t, idx) { 
            var html = that.render(t);
            taskContainerDiv.append(html);
          });
        }); 
      }
      
      return exp;
  }());
}(window.jQuery, window._))
