require "gorails"
require "net/http"
require "json"

module Gorails
  module Commands
    class Railsbytes < Gorails::Command
      def call(args, _name)
        if args.none?
          list
        else
          apply(args.first)
        end
      end

      def self.help
        <<~EOF
          View the latest Railsbytes templates or load a template by ID.
          Usage:
            {{command:#{Gorails::TOOL_NAME} railsbytes}}
            {{command:#{Gorails::TOOL_NAME} railsbytes x7msKX}}
        EOF
      end

      def list
        bytes = JSON.parse Net::HTTP.get(URI("https://railsbytes.com/public/templates.json"))

        CLI::UI::Frame.open("Railsbytes") do
          bytes.each do |byte|
            puts CLI::UI.fmt "{{green:#{byte["name"]}}} by #{byte["created_by"]}"
            puts byte["short_description"]
            puts "#{byte["id"]} - #{byte["url"]}"
            puts
          end
        end
      end

      def apply(id)
        byte = JSON.parse Net::HTTP.get(URI("https://railsbytes.com/public/templates/#{id}.json"))

        CLI::UI::Frame.open("Railsbyte") do
          puts CLI::UI.fmt "{{green:#{byte["name"]}}} by #{byte["created_by"]}"
          puts byte["short_description"]
          puts

          CLI::UI::Prompt.ask("What would you like to do?") do |handler|
            handler.option("View source") do |selection|
              puts
              puts byte["script"]
            end

            handler.option("Apply Railsbyte") do |selection|
              puts
              puts "Running Railsbyte..."

              Bundler.with_original_env do
                system "rails app:template LOCATION=\"https://railsbytes.com/script/#{id}\""
              end
            end

            handler.option("exit") { |selection| exit 0 }
          end
        end
      end
    end
  end
end
