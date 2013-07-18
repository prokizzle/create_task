module CreateTask
  require 'chronic'

  class OmniFocus
    require 'appscript';include Appscript


    def initialize(args)
      args[:due_date] = parse_date(args[:due_date])
      args[:start_date] = parse_date(args[:start_date])

      of = app("OmniFocus")
      @dd= of.default_document
      @dd.make(:new => :inbox_task, :with_properties => args.to_hash)
    end

    def parse_date(datestring)
      days = 0
      if datestring =~ /^\+(\d+)$/
        days = (60 * 60 * 24 * $1.to_i)
        newdate = Time.now + days
      else
        newdate = Chronic.parse(datestring, {:context => :future, :ambiguous_time_range => 8})
      end
      # parsed = newdate.strftime('%D %l:%M%p').gsub(/\s+/,' ');
      # return parsed =~ /1969/ ? false : parsed
      return newdate
    end



  end

  class Reminders
    # include 'helper'
    def initialize(args)
      name = args[:name]
      # due_date = parse_date(args[:due_date])
      due_date = args[:due_date]
      remind = %x{osascript <<'APPLESCRIPT'
                  set d_date to date "#{due_date}"
                  tell application "Reminders" to show (make new reminder with properties {name:"#{name}", due date:(d_date)})
                  APPLESCRIPT}
    end

    def parse_date(datestring)
      days = 0
      if datestring =~ /^\+(\d+)$/
        days = (60 * 60 * 24 * $1.to_i)
        newdate = Time.now + days
      else
        newdate = Chronic.parse(datestring, {:context => :future, :ambiguous_time_range => 8})
      end
      # parsed = newdate.strftime('%D %l:%M%p').gsub(/\s+/,' ');
      # return parsed =~ /1969/ ? false : parsed
      return newdate
    end

  end

  class DueApp
    # include 'helper'
    def initialize(args)
      name = args[:name]
      # due_date = parse_date(args[:due_date])
      due_date = args[:due_date]
      remind =%x{osascript << 'APPLESCRIPT'
                 set d_date to date "#{due_date}"
                 set theURl to "due:///add?title=#{name}&due_date=" & d_date
                 tell application "Finder" to open location theURl
                 tell application "Due" to activate
                 delay 0.5 -- This delay can be tweaked for your system
                 tell application "Due" to activate
                 tell application "System Events" to key code 36
                 delay 1 -- This delay can be tweaked for your system
                 APPLESCRIPT
                 }

    end

    def parse_date(datestring)
      days = 0
      if datestring =~ /^\+(\d+)$/
        days = (60 * 60 * 24 * $1.to_i)
        newdate = Time.now + days
      else
        newdate = Chronic.parse(datestring, {:context => :future, :ambiguous_time_range => 8})
      end
      # parsed = newdate.strftime('%D %l:%M%p').gsub(/\s+/,' ');
      # return parsed =~ /1969/ ? false : parsed
      return newdate
    end
  end

  class Things
    def initialize(args)
      name = args[:name]
      due_date = args[:due_date]
      notes = args[:notes]
      tags = args[:tag]
      remind = %x{osascript << 'APPLESCRIPT'
                  set d_date to date "#{due_date}"
                  tell application "Things"
                  set newToDo to make new to do with properties {name: "#{name}"}
                    set newToDo's notes to "#{notes}"
                    set newToDo's due date to d_date
                    set tag names of newToDo to "#{tags}"
                  end tell
                  APPLESCRIPT}
    end
  end

end
