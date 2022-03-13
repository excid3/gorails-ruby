require "gorails"

module Gorails
  module Commands
    class Version < Gorails::Command
      def call(_args, _name)
        puts Gorails::VERSION
      end

      def self.help
        "Prints the version.\nUsage: {{command:#{Gorails::TOOL_NAME} version}}"
      end
    end
  end
end
