module Kvn
  class Parser
    attr_reader :value

    def initialize(value)
      @value = value.to_s.strip
    end

    def parse
      lexer = Kvn::Lexer.new
      output = lexer.lex(value)
      {}.tap do |parsed|
        begin
          key = nil
          key_found = false
          value_found = false
          while output.peek
            token = output.next
            if token.name == :KEY
              key = token.value
              key_found = true
              value_found = false
            end

            if token.name == :VALUE
              raise SyntaxError.new("Empty key detected for value! <#{token.value}>") unless key_found
              parsed[key] = parse_value(token.value)
              value_found = true
              key_found = false
            end

            if token.name == :PAIRDELIM && !value_found
              raise SyntaxError.new("Empty value detected for key! <#{key}>")
            end
          end
        rescue StopIteration
        end
      end
    end

    private

    def parse_value(value)
      lexer = Kvn::ValueLexer.new
      token = lexer.lex(value).next
      case token.name
      when :NIL then value = nil
      when :TRUE then value = true
      when :FALSE then value = false
      when :FLOAT then value = value.to_f
      when :INTEGER then value = value.to_i
      else value.to_s
      end
    end

  end
end
