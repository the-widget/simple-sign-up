$(function () {
  $(".js-showEvent").on("click", function(click) {
    click.preventDefault();
    var eventId = parseInt($(click['target']).attr("data-id"));
    var tasks_html = ""
    var users_html = ""

    function Event(id, title, date, description, start_time, end_time, tasks, user){
      this.id = id
      this.title = title
      this.date = date
      this.description = description
      this.start_time = start_time
      this.end_time = end_time
      this.tasks = tasks
      this.user = user //Organizer
      this.display_each_task = function(){
        $.each(this.tasks, function(i, task){
        tasks_html = tasks_html.concat("<a href=/events/" + this.id + "/" + "tasks" + "/" + task.id + ">" + task.title + "</a><br>");
        });
      };
      var users = {} //Workers
      this.display_each_user = function() {
        $.each(this.tasks, function(i, task){
        // assigning object keys (instead of Array.push) causes an overwrite, making it unique.
          $.each(task.users, function(i, user){ 
            users[user.id] = user.name
          });
        });
        for(var i in users){ // Loops through the keys in 'users' to concat
          users_html = users_html.concat("<li class='users'" + "data-id" + ":" + i + ">" + users[i])
        } 
      }
    }

    $.get("/events/" + eventId + ".json", function(data) {

      var event = new Event(data['id'], data['title'], data['date'], data['description'], data['start_time'], data['end_time'], data['tasks'], data['user']);
      event.display_each_task();
      event.display_each_user();

      var showEvent = "</div><div class='event-show'><strong class='text-warning'>Organized By:</strong> <text>" + event.user.name + "</text><br> <strong>Date: </strong>" + event.date + "<br> <strong>From: </strong>" + event.start_time + " to" + event.end_time + "<hr> <strong>Description: </strong>" + event.description + "<hr> <strong>Tasks:</strong> <br>" + tasks_html + "<br><strong> Participants: </strong><br>" + users_html + "<hr> <a id='return' href='#' class='js-back'e> Return To Events <a></div>"

      var eventNav = "<div class='page-nav'><a id='edit_event' href='/events/2/edit'>Edit Event</a>" + " | " + "<a id='add_event' href='/events/2/tasks/new'>Add Task</a>" + " | " + "<a id='delete_event' data-confirm='Are you sure you want to do delete this event?' rel='nofollow' data-method='delete' href='/events/2'>Delete Event</a></div>"

      var newEvent = "<a id='new-event' class='page-nav' href='/events/new'>Create New Event</a>"
      
      $(".title").html(event['title']);
      //$(".page-nav").html(); WORK ON PAGE NAV
      $('.event-index').toggle("hide")
      $('.event-show').toggle("hide")
      $('.event-show').replaceWith(showEvent)
      $('#new-event').replaceWith(eventNav)

      $(".js-back").on("click", function(click){
        click.preventDefault();
        
        $('.event-index').toggle("hide")
        $('.event-show').toggle("hide")
        $(".title").html("Events");
        $('.page-nav').replaceWith(newEvent)
      });



      
    });
  });
  
  

});



