# frozen_string_literal: true

require "pry-test"
require "coveralls"
Coveralls.wear!
SimpleCov.command_name "pry-test"
require_relative "../lib/kvn"
