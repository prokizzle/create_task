# CreateTask Gem
module CreateTask
  # Creates a task in Things app
  class Things < CreateTask::Helper
    def self.create(args)
      `osascript << 'APPLESCRIPT'
         set d_date to date "#{args[:due_date]}"
         tell application "Things"
         set newToDo to make new to do with properties {name: "#{args[:name]}"}
          set newToDo's notes to "#{args[:due_date]}"
                    set newToDo's due date to d_date
          set tag names of newToDo to "#{args[:tag]}"
        end tell
         APPLESCRIPT`
    end
  end
end
