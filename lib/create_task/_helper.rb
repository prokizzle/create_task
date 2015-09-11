# CreateTask gem
module CreateTask
  # Helper for creating tasks
  class Helper
    def self.new_task(task, app)
      task = {name: name, due_date: due, start_date: start, note: note}
      CreateTask::OmniFocus.create(task) if app == 'omnifocus'
      CreateTask::Reminders.create(task) if app == 'reminders'
      CreateTask::Things.create(task) if app == 'things'
      CreateTask::DueApp.create(task) if app == 'dueapp'
    end

    def default_parsed_date(datestring)
      Chronic.parse(
        datestring.to_s,
        context: :future, ambiguous_time_range: 8
      )
    end

    def parse_date(datestring)
      return default_parsed_date(datestring) unless datestring =~ /^\+(\d+)$/
      days = (60 * 60 * 24 * Regexp.last_match[1].to_i)
      Time.now + days
    end
  end
end
