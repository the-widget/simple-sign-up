# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  user = User.create(name: "Test Organizer 1", email: "test@email.com", password: "asdfasdf", role: "organizer")
  user_2 = User.create(name: "Test Organizer 2", email: "test111@email.com", password: "asdfasdf", role: "organizer")
  
  user_3 = User.create(name: "Test Volunteer 1", email: "test122@email.com", password: "asdfasdf", role: "member")
  user_4 = User.create(name: "Test Volunteer 2", email: "test133@email.com", password: "asdfasdf", role: "member")
  user_5 = User.create(name: "Test Volunteer 3", email: "test144@email.com", password: "asdfasdf", role: "member")
  user_6 = User.create(name: "Test Volunteer 4", email: "test155@email.com", password: "asdfasdf", role: "member")
  user_7 = User.create(name: "Test Volunteer 5", email: "test166@email.com", password: "asdfasdf", role: "member")
  user_8 = User.create(name: "Test Volunteer 6", email: "test177@email.com", password: "asdfasdf", role: "member")
  user_9 = User.create(name: "Test Volunteer 7", email: "test188@email.com", password: "asdfasdf", role: "member")
  user_10 = User.create(name: "Test Volunteer 8", email: "test199@email.com", password: "asdfasdf", role: "member")
  user_11 = User.create(name: "Test Volunteer 9", email: "test211@email.com", password: "asdfasdf", role: "member")
  user_12 = User.create(name: "Test Volunteer 10", email: "test222@email.com", password: "asdfasdf", role: "member")

  volunteer_1 = User.create(name: "Test Worker 1", email: "test11@email.com", password: "asdfasdf", role: "member")
  volunteer_2 = User.create(name: "Test Worker 2", email: "test12@email.com", password: "asdfasdf", role: "member")
  volunteer_3 = User.create(name: "Test Worker 3", email: "test13@email.com", password: "asdfasdf", role: "member")
  volunteer_4 = User.create(name: "Test Worker 4", email: "test14@email.com", password: "asdfasdf", role: "member")
  volunteer_5 = User.create(name: "Test Worker 5", email: "test15@email.com", password: "asdfasdf", role: "member")

  event_1 = user.events.build(title: "Test Event 1", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos adipisci fugiat vero commodi, saepe culpa quod quo tempora voluptas exercitationem. Eius beatae numquam recusandae non placeat facilis harum officiis voluptas.", date: "06/09/2016", start_time: "12:00 AM", end_time: "12:00 AM")
  event_1.save
  event_2 = user.events.build(title: "Test Event 2", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos adipisci fugiat vero commodi, saepe culpa quod quo tempora voluptas exercitationem. Eius beatae numquam recusandae non placeat facilis harum officiis voluptas.", date: "08/26/2016", start_time: "12:00 AM", end_time: "12:00 AM")
  event_2.save
  event_3 = user.events.build(title: "Test Event 3", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos adipisci fugiat vero commodi, saepe culpa quod quo tempora voluptas exercitationem. Eius beatae numquam recusandae non placeat facilis harum officiis voluptas.", date: "08/26/2016", start_time: "12:00 AM", end_time: "12:00 AM")
  event_3.save

  task_1 = event_1.tasks.build(title: "Janitorial Services", description: "Sweep and mop floors. Clean buildings by emptying trash, sweeping, and cleaning surfaces. Clean and disinfect surfaces. Sterilize bathrooms.", start_time: "12:00 AM", end_time: "12:00 AM", workers_required: "3")
  task_1.save
  task_2 = event_1.tasks.build(title: "Host", description: "Greet guests and find them a nice place to sit.", start_time: "12:00 AM", end_time: "12:00 AM", workers_required: "1")
  task_2.save
  task_3 = event_1.tasks.build(title: "Food Servers", description: "Serve the guests from the buffet line.", start_time: "12:00 AM", end_time: "12:00 AM", workers_required: "9")
  task_3.save

  task_4 = event_2.tasks.build(title: "Janitorial Services", description: "Sweep and mop floors. Clean buildings by emptying trash, sweeping, and cleaning surfaces. Clean and disinfect surfaces. Sterilize bathrooms.", start_time: "12:00 AM", end_time: "12:00 AM", workers_required: "5")
  task_4.save
  task_5 = event_2.tasks.build(title: "Host", description: "Greet guests and find them a nice place to sit.", start_time: "12:00 AM", end_time: "12:00 AM", workers_required: "2")
  task_5.save
  task_6 = event_2.tasks.build(title: "Food Servers", description: "Serve the guests from the buffet line.", start_time: "12:00 AM", end_time: "12:00 AM", workers_required: "12")
  task_6.save

  task_7 = event_3.tasks.build(title: "Janitorial Services", description: "Sweep and mop floors. Clean buildings by emptying trash, sweeping, and cleaning surfaces. Clean and disinfect surfaces. Sterilize bathrooms.", start_time: "12:00 AM", end_time: "12:00 AM", workers_required: "9")
  task_7.save
  task_8 = event_3.tasks.build(title: "Host", description: "Greet guests and find them a nice place to sit.", start_time: "12:00 AM", end_time: "12:00 AM", workers_required: "1")
  task_8.save
  task_9 = event_3.tasks.build(title: "Food Servers", description: "Serve the guests from the buffet line.", start_time: "12:00 AM", end_time: "12:00 AM", workers_required: "4")
  task_9.save

  task_1.participants << user_3
  task_1.participants << user_4
  task_1.participants << volunteer_4

  task_2.participants << volunteer_1

  task_3.participants << user_5
  task_3.participants << user_6
  task_3.participants << user_7

  task_4.participants << user_8
  task_4.participants << user_9

  task_5.participants << volunteer_2
  task_5.participants << volunteer_3







