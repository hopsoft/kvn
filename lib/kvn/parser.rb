module Kvn
  class Parser
    attr_reader :value

    def initialize(value)
      @value = value.to_s.strip
      @lexer = Kvn::Lexer.new
      @value_lexer = Kvn::ValueLexer.new
    end

    def parse
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
              value_output = value_lexer.lex(token.value)
              parsed[key] = value_output.next.value
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

    attr_reader :lexer, :value_lexer

  end
end
