# frozen_string_literal: true

module Kvn
  class Lexer < Lex::Lexer
    tokens(
      :KEY,
      :VALUE,
      :PAIRDELIM,
      :PARTDELIM
    )

    rule :KEY, /\w+(?=:)/
    rule :VALUE, /[\w\s.\-]+(?=;)/
    rule :PAIRDELIM, /;\s*/
    rule :PARTDELIM, /:/

    error do |lexer, token|
      message = "Illegal character in KVN string! #{token.line}:#{token.column} <#{token.value}>"
      raise SyntaxError.new(message)
    end
  end
end
