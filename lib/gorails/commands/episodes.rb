require 'gorails'
require "net/http"
require "json"

module Gorails
  module Commands
    class Episodes < Gorails::Command
      def call(_args, _name)
        episodes = JSON.parse Net::HTTP.get(URI('https://gorails.com/episodes.json'))

        CLI::UI::Frame.open('Latest GoRails episodes') do
          episodes.each do |episode|
            puts CLI::UI.fmt "##{episode["number"]} {{green:#{episode["name"]}}}"
            puts episode["url"]
            puts
          end
        end
      end

      def self.help
        "View the latest GoRails episodes.\nUsage: {{command:#{Gorails::TOOL_NAME} episodes}}"
      end
    end
  end
end
