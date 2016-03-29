require "kvn/version"
require "kvn/illegal_character_error"
require "kvn/lexer"
require "kvn/parser"

module Kvn
  class << self

    def parse(value)
      raise ArgumentError.new("Value is not a valid KVN string!") unless valid?(value)
      pairs = standardize(value).split(";")
      pairs.each_with_object({}) do |pair, memo|
        parts = pair.split(":")
        memo[parts.first] = parts.last
      end
    end

    def valid?(value)
      value = standardize(value)
      semicolon_count = value.scan(";").size
      colon_count = value.scan(":").size
      return false unless semicolon_count > 0
      return false unless colon_count > 0
      return false unless semicolon_count == colon_count
    end

    private

    def standardize(value)
      value.to_s.strip
    end

  end
end
