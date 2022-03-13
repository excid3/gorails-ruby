require "gorails"
require "net/http"
require "json"

module Gorails
  module Commands
    class Jobs < Gorails::Command
      def call(_args, _name)
        jobs = JSON.parse Net::HTTP.get(URI("https://jobs.gorails.com/jobs.json"))

        CLI::UI::Frame.open("Ruby on Rails jobs") do
          jobs.each do |job|
            puts CLI::UI.fmt "{{green:#{job["title"]}}} at {{blue:#{job.dig("company", "name")}}}"
            puts job["url"]
            puts
          end
        end
      end

      def self.help
        "View the latest Ruby on Rails jobs.\nUsage: {{command:#{Gorails::TOOL_NAME} jobs}}"
      end
    end
  end
end
