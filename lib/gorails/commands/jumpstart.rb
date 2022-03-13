require 'gorails'
require "net/http"
require "json"

module Gorails
  module Commands
    class Jumpstart < Gorails::Command
      def call(_args, _name)
        name = _args.first

        if name.nil?
          puts CLI::UI.fmt "{{red:Application name is required.}}"
          puts "Try again with \"gorails jumpstart myapp\""
          exit 1
        end

        CLI::UI::Frame.open("Generating Jumpstart application \"#{name}\"") do
          Bundler.with_original_env do
            system "rails new #{name} -d postgresql -m https://raw.githubusercontent.com/excid3/jumpstart/master/template.rb"
          end
        end
      end

      def self.help
        "Create a new Ruby on Rails application with the Jumpstart template. https://github.com/excid3/jumpstart\nUsage: {{command:#{Gorails::TOOL_NAME} jumpstart myapp}}"
      end
    end
  end
end
