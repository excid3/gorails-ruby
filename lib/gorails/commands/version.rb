require "gorails"

module Gorails
  module Commands
    class Example < Gorails::Command
      def call(_args, _name)
        puts VERSION
      end

      def self.help
        "Prints the version.\nUsage: {{command:#{Gorails::TOOL_NAME} version}}"
      end
    end
  end
end
