$(function () {
  $(".js-showTask").on("click", function(click) {
    click.preventDefault();
    var taskId = parseInt($(click['target']).attr("data-id"));
    var users_html = ""

    // COPIED FROM EVENTS - NEED TO CHANGE


    // function Task(id, title, description, start_time, end_time, users){
    //   this.id = id
    //   this.title = title
    //   this.description = description
    //   this.start_time = start_time
    //   this.end_time = end_time
    //   this.users = users //Workers
    //   this.display_each_task = function(){
    //     $.each(this.tasks, function(i, task){
    //     tasks_html = tasks_html.concat("<a class='task' href=/events/" + this.id + "/" + "tasks" + "/" + task.id + " data-id=" + task.id + ">" + task.title + "</a><br>");
    //     });
    //   };
    //   var users = {} //Workers
    //   this.display_each_user = function() {
    //     $.each(this.tasks, function(i, task){
    //     // assigning object keys (instead of Array.push) causes an overwrite, making it unique.
    //       $.each(task.users, function(i, user){ 
    //         users[user.id] = user.name
    //       });
    //     });
    //     for(var i in users){ // Loops through the keys in 'users' to concat
    //       users_html = users_html.concat("<li class='users'" + "data-id" + ":" + i + ">" + users[i])
    //     } 
    //   }
    // }