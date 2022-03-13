require "gorails"

module Gorails
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(default: "help")

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(-> { const_get(const) }, cmd)
    end

    register :Episodes, "episodes", "gorails/commands/episodes"
    register :Jobs, "jobs", "gorails/commands/jobs"
    register :Jumpstart, "jumpstart", "gorails/commands/jumpstart"
    register :Railsbytes, "railsbytes", "gorails/commands/railsbytes"
    # register :Example, 'example', 'gorails/commands/example'
    register :Help, "help", "gorails/commands/help"
  end
end
