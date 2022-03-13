require 'gorails'

module Gorails
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(
      default: 'help',
      contextual_resolver: nil
    )

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(->() { const_get(const) }, cmd)
    end

    register :Episodes, 'episodes', 'gorails/commands/episodes'
    register :Railsbytes, 'railsbytes', 'gorails/commands/railsbytes'
    register :Jobs, 'jobs', 'gorails/commands/jobs'
    register :Example, 'example', 'gorails/commands/example'
    register :Help,    'help',    'gorails/commands/help'
  end
end

