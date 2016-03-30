module Kvn
  class ValueLexer < Lex::Lexer
    tokens(
      :NIL,
      :TRUE,
      :FALSE,
      :FLOAT,
      :INTEGER,
      :STRING
    )

    rule :NIL, /null/ do |lexer, token|
      token.tap { |t| t.value = nil }
    end

    rule :TRUE, /true/ do |lexer, token|
      token.tap { |t| t.value = true }
    end

    rule :FALSE, /false/ do |lexer, token|
      token.tap { |t| t.value = false }
    end

    rule :FLOAT, /\d+\.\d+/ do |lexer, token|
      token.tap { |t| t.value = t.value.to_f }
    end

    rule :INTEGER, /\d+/ do |lexer, token|
      token.tap { |t| t.value = t.value.to_i }
    end

    rule :STRING, /.*/ do |lexer, token|
      token.tap { |t| t.value = t.value.to_s }
    end
  end
end
