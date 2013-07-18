#Create Task
_A module for creating tasks in OmniFocus, Things, DueApp, and Apple Reminders on the Mac_

I created this module for easy integration from my ruby apps into the Big 4 of Task Managers.

To use this in your app, simply include
    lib/create_todo.rb
in your source.

__Creating tasks is as easy as__

    CreateTask::OmniFocus.new(name: "Task name", note: "Task note", start_date: "7/17/2013", due_date: "7/29/2013")

    CreateTask::Things.new(name: "Task name", note: "Task note", due_date: "7/17/2013", tags: "github, gtd")

    CreateTask::DueApp.new(name: "Task name", due_date: "7/17/2013")

    CreateTask::Reminders.new(name: "Task name", due_date: "7/17/2013")

  ###Requirements:
  - AppScript (for OmniFocus)
  - Chronic (for date parsing)
  - A Mac (no brainer)