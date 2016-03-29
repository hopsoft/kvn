module Kvn
  class Parser

    def parse(value)
      parsed = {}
      lexer = Kvn::Lexer.new
      output = lexer.lex(standardize_value(value))

      begin
        key = nil
        while output.peek
          token = output.next
          key = token.value if token.name == :KEY
          parsed[key] = token.value if token.name == :VALUE
        end
      rescue StopIteration
      end

      parsed
    end

    private

    def standardize_value(value)
      value.to_s.strip
    end

  end
end
