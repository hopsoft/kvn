require "lex"

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

    rule :NIL, /null/
    rule :TRUE, /true/
    rule :FALSE, /false/
    rule :FLOAT, /\d+\.\d+/
    rule :INTEGER, /\d+/
    rule :STRING, /.*/
  end
end
