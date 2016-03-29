module Kvn
  class Parser
    attr_reader :value

    def initialize(value)
      @value = value.to_s.strip
      @lexer = Kvn::Lexer.new
    end

    def parse
      output = lexer.lex(value)
      {}.tap do |parsed|
        begin
          key = nil
          while output.peek
            token = output.next
            key = token.value if token.name == :KEY
            parsed[key] = token.value if token.name == :VALUE
          end
        rescue StopIteration
        end
      end
    end

    private

    attr_reader :lexer
  end
end
