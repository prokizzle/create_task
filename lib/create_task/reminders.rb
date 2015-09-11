# CreateTask gem
module CreateTask
  # Creates a task in Reminders for Mac
  class Reminders
    def initialize(args)
      name = args[:name]
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
end
