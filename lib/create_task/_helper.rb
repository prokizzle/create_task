# CreateTask gem
module CreateTask
  # Helper for creating tasks
  class Helper
    def self.new_task(coupon, settings)
      CreateTask::OmniFocus.create(coupon.to_hash) if settings.use_omnifocus
      CreateTask::Reminders.create(coupon.to_hash) if settings.use_reminders
      CreateTask::Things.create(coupon.to_hash) if settings.use_things
      CreateTask::DueApp.create(coupon.to_hash) if settings.use_dueapp
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
