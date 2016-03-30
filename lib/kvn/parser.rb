module Kvn
  class Parser
    attr_reader :value

    def initialize(value)
      @value = value.to_s.strip
    end

    def parse
      lexer = Kvn::Lexer.new
      value_lexer = Kvn::ValueLexer.new
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
              parsed[key] = value_lexer.lex(token.value).next.value
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

  end
end
