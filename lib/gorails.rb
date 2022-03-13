# frozen_string_literal: true

require_relative "gorails/version"
require 'cli/ui'
require 'cli/kit'

CLI::UI::StdoutRouter.enable

module Gorails
  class Error < StandardError; end

  extend CLI::Kit::Autocall

  TOOL_NAME = 'gorails'
  ROOT      = File.expand_path('../..', __FILE__)
  LOG_FILE  = '/tmp/myproject.log'

  autoload(:EntryPoint, 'gorails/entry_point')
  autoload(:Commands,   'gorails/commands')

  autocall(:Config)  { CLI::Kit::Config.new(tool_name: TOOL_NAME) }
  autocall(:Command) { CLI::Kit::BaseCommand }

  autocall(:Executor) { CLI::Kit::Executor.new(log_file: LOG_FILE) }
  autocall(:Resolver) do
    CLI::Kit::Resolver.new(
      tool_name: TOOL_NAME,
      command_registry: Gorails::Commands::Registry
    )
  end

  autocall(:ErrorHandler) do
    CLI::Kit::ErrorHandler.new(
      log_file: LOG_FILE,
      exception_reporter: nil
    )
  end
end
