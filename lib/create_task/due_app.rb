# CreateTask Gem
module CreateTask
  # Creates a task in Due App
  class DueApp < CreateTask::Helper
    # include 'helper'
    def self.create(args)
      name = args[:name]
      due_date = args[:due_date]
      `osascript << 'APPLESCRIPT'
         set d_date to date "#{due_date}"
         set theURl to "due:///add?title=#{name}&due_date=" & d_date
         tell application "Finder" to open location theURl
         tell application "Due" to activate
         delay 0.5 -- This delay can be tweaked for your system
         tell application "Due" to activate
         tell application "System Events" to key code 36
         delay 1 -- This delay can be tweaked for your system
         APPLESCRIPT`
    end
  end
end
