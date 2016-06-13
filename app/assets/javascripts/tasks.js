$(function () {
  $(".js-showTask").on("click", function(click) {
    click.preventDefault();
    var taskId = parseInt($(click['target']).attr("data-id"));
    var eventId = parseInt($(click['target']).attr("data-eventId"));
    var users_html = ""

    function Task(id, title, description, start_time, end_time, users){
      this.id = id
      this.title = title
      this.description = description
      this.start_time = start_time
      this.end_time = end_time
      this.users = users //Workers
      var userList = {} //Workers
      this.display_each_user = function() {
        $.each(this.users, function(i, user){ 
          userList[user.id] = user.name
        });
        for(var i in userList){ // Loops through the keys in 'userList' to concat
          users_html = users_html.concat("<li class='users'" + " data-id=" + i + ">" + userList[i])
        };
      };
    };

    
    $.get("/events/" + eventId + "/" + "tasks" + "/" + taskId + ".json", function(data) {
      var task = new Task(data['id'], data['title'], data['description'], data['start_time'], data['end_time'], data['users']);
      task.display_each_user();
      console.log(users_html)
    });
  });
});