# CreateTask Gem
module CreateTask
  # Creates a task in OmniFocus
  class OmniFocus
    require 'appscript';include Appscript


    def initialize(args)
      args[:due_date] = parse_date(args[:due_date])
      args[:start_date] = parse_date(args[:start_date])

      of = app('OmniFocus')
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
end
