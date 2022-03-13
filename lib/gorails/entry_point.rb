require "gorails"

module Gorails
  module EntryPoint
    def self.call(args)
      cmd, command_name, args = Gorails::Resolver.call(args)
      Gorails::Executor.call(cmd, command_name, args)
    end
  end
end
