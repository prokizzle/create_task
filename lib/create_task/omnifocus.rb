# CreateTask Gem
module CreateTask
  # Creates a task in OmniFocus
  class OmniFocus < CreateTask::Helper
    def self.create(args)
      of = app('OmniFocus')
      dd= of.default_document
      dd.make(new: :inbox_task, with_properties: processed_args(args))
    end

    def self.processed_args(args)
      if args[:start_date]
        args[:defer_date] = args[:start_date]
        args.delete(:start_date)
      end
      args[:due_date] = parse_date(args[:due_date]) if args[:due_date]
      args[:defer_date] = parse_date(args[:defer_date]) if args[:defer_date]
      puts args
      args
    end
  end
end
