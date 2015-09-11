# CreateTask Gem
module CreateTask
  # Creates a task in OmniFocus
  class OmniFocus
    require 'appscript'#;include Appscript
    def self.create(args)
      args[:due_date] = parse_date(args[:due_date]) if args[:due_date]
      args[:defer_date] = parse_date(args[:defer_date]) if args[:defer_date]

      of = app('OmniFocus')
      dd= of.default_document
      dd.make(new: :inbox_task, with_properties: args.to_hash)
    end
  end
end
