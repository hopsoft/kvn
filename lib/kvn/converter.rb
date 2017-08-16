module Kvn
  class Converter
    attr_reader :value

    def initialize(value)
      @value = (value ||= {}).to_h rescue {}

      if invalid_values_present?
        message = "All values must be a supported type! #{Kvn::SUPPORTED_VALUE_TYPES.join ", "}"
        raise Kvn::UnsupportedHashError.new(message)
      end
    end

    def convert
      value.keys.sort.each_with_object([]) do |key, memo|
        v = value[key]
        v = "null" if v.nil?
        next if v.to_s.strip.empty?
        memo << "#{key}:#{v};"
      end.join(" ")
    end

    private

    def value_types
      value.values.map(&:class).uniq
    end

    def invalid_values_present?
      !(value_types - Kvn::SUPPORTED_VALUE_TYPES).empty?
    end

  end
end
