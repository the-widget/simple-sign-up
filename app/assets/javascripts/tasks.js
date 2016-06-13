$(function () {
  $(".js-showTask").on("click", function(click) {
    click.preventDefault();
    var taskId = parseInt($(click['target']).attr("data-id"));
    var eventId = parseInt($(click['target']).attr("data-eventId"));
    var eventTitle = ($(click['target']).attr("data-eventTitle"));

    var users_html = ""
    var userList = {} //Workers

    function Task(id, title, description, start_time, end_time, workers_required, users){
      this.id = id
      this.title = title
      this.description = description
      this.start_time = start_time
      this.end_time = end_time
      this.workers_required = workers_required
      this.users = users //Workers
      this.display_each_user = function() {
        $.each(this.users, function(i, user){ 
          userList[user.id] = user.name
        });
        for(var i in userList){ // Loops through the keys in 'userList' to concat
          users_html = users_html.concat("<text class='users'" + " data-id=" + i + ">" + userList[i] + "</text><br>")
        };
      };
    };

    
    $.get("/events/" + eventId + "/" + "tasks" + "/" + taskId + ".json", function(data) {
      var task = new Task(data['id'], data['title'], data['description'], data['start_time'], data['end_time'], data['workers_required'], data['users']);
      task.display_each_user();

      var showTask = "<strong>Workers Required: </strong>" + task.workers_required + "<br><br><strong>Description: </strong>" + task.description + "<br><br><strong>Time Slot: </strong>" + task.start_time + " - " + task.end_time + "<br><br><strong>Participants: " + Object.keys(userList).length + " / " + task.workers_required + "</strong><br>" + users_html + "<hr> <a id='return' href='#' class='js-back'e> Return To Event <a></div>" 

      var taskNav = "<button><a href='/events/2/tasks/4/set_role'>Sign Up For This Task</a></button>"
      var eventNav = "<div class='page-nav'><a id='edit_event' href='/events/2/edit'>Edit Event</a>" + " | " + "<a id='add_event' href='/events/2/tasks/new'>Add Task</a>" + " | " + "<a id='delete_event' data-confirm='Are you sure you want to do delete this event?' rel='nofollow' data-method='delete' href='/events/2'>Delete Event</a></div>"

      $('.event-show').toggle("hide")
      $('.task-show').html(showTask)
      $('.task-show').toggle("hide")
      $(".title").html(task['title'])
      $(".page-nav").replaceWith(taskNav)
      

      $(".js-back").on("click", function(click){
        click.preventDefault();
        
        $('.task-show').toggle("hide")
        $('.event-show').toggle("hide")
        $(".title").html(eventTitle);
        $('.page-nav').replaceWith(eventNav)
      });

      
    });
  });
});

// var showEvent = "</div><div class='event-show'><strong class='text-warning'>Organized By:</strong> <text>" + event.user.name + "</text><br> <strong>Date: </strong>" + event.date + "<br> <strong>From: </strong>" + event.start_time + " to" + event.end_time + "<hr> <strong>Description: </strong>" + event.description + "<hr> <strong>Tasks:</strong> <br>" + tasks_html + "<br><strong> Participants: </strong><br>" + users_html + "<hr> <a id='return' href='#' class='js-back'e> Return To Events <a></div>"

//       var eventNav = "<div class='page-nav'><a id='edit_event' href='/events/2/edit'>Edit Event</a>" + " | " + "<a id='add_event' href='/events/2/tasks/new'>Add Task</a>" + " | " + "<a id='delete_event' data-confirm='Are you sure you want to do delete this event?' rel='nofollow' data-method='delete' href='/events/2'>Delete Event</a></div>"

//       var newEvent = "<a id='new-event' class='page-nav' href='/events/new'>Create New Event</a>"
      
//       $(".title").html(event['title']);
//       //$(".page-nav").html(); WORK ON PAGE NAV
//       $('.event-index').toggle("hide")
//       $('.event-show').toggle("hide")
//       $('.event-show').replaceWith(showEvent)
//       $('#new-event').replaceWith(eventNav)
//       $('.jumbotron').append("<script type='text/javascript' src='assets/tasks.js' charset='utf-8'/>")

//       });  
//     });
//   });
// });
