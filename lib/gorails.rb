# frozen_string_literal: true

require_relative "gorails/version"
require "cli/ui"
require "cli/kit"

CLI::UI::StdoutRouter.enable

module Gorails
  class Error < StandardError; end

  TOOL_NAME = "gorails"
  ROOT = File.expand_path("../..", __FILE__)
  LOG_FILE = "/tmp/gorails.log"

  autoload(:EntryPoint, "gorails/entry_point")
  autoload(:Commands, "gorails/commands")

  Config = CLI::Kit::Config.new(tool_name: TOOL_NAME)
  Command = CLI::Kit::BaseCommand

  Executor = CLI::Kit::Executor.new(log_file: LOG_FILE)
  Resolver = CLI::Kit::Resolver.new(
    tool_name: TOOL_NAME,
    command_registry: Gorails::Commands::Registry
  )

  ErrorHandler = CLI::Kit::ErrorHandler.new(log_file: LOG_FILE)
end
