require "gorails"

module Gorails
  module Commands
    class Help < Gorails::Command
      def call(args, _name)
        puts CLI::UI.fmt("{{bold:Available commands}}")
        puts ""

        Gorails::Commands::Registry.resolved_commands.each do |name, klass|
          next if name == "help"
          puts CLI::UI.fmt("{{command:#{Gorails::TOOL_NAME} #{name}}}")
          if (help = klass.help)
            puts CLI::UI.fmt(help)
          end
          puts ""
        end
      end
    end
  end
end
