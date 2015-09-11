# CreateTask gem
module CreateTask
  # Creates a task in Reminders for Mac
  class Reminders < CreateTask::Helper
    def self.create(args)
      name = args[:name]
      `osascript <<'APPLESCRIPT'
         set d_date to date "#{args[:due_date]}"
         tell application "Reminders" to show
         (make new reminder with properties {name:"#{name}", due date:(d_date)})
         APPLESCRIPT`
    end
  end
end
