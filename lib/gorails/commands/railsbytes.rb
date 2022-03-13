require 'gorails'
require "net/http"
require "json"

module Gorails
  module Commands
    class Railsbytes < Gorails::Command
      def call(_args, _name)
        bytes = JSON.parse Net::HTTP.get(URI('https://railsbytes.com/public/templates.json'))

        CLI::UI::Frame.open('Railsbytes') do
          bytes.each do |byte|
            puts CLI::UI.fmt "{{green:#{byte["name"]}}} by #{byte["created_by"]}"
            puts byte["short_description"]
            puts "#{byte["id"]} - #{byte["url"]}"
            puts
          end
        end
      end

      def self.help
        "View the latest Railsbytes templates.\nUsage: {{command:#{Gorails::TOOL_NAME} railsbytes}}"
      end
    end
  end
end
