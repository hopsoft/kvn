require "lex"

module Kvn
  class Lexer < Lex::Lexer
    tokens(
      :KEY,
      :VALUE,
      :PAIRDELIM,
      :PARTDELIM
    )

    rule :KEY, /(\w|\s)+(?=:)/
    rule :VALUE, /(\w|\s)+(?=;)/
    rule :PAIRDELIM, /;\s*/
    rule :PARTDELIM, /:/
  end
end
