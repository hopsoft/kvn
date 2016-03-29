require_relative "../lib/kvn"

module Kvn
  class LexerTest < PryTest::Test

    test "valid input" do
      lexer = Kvn::Lexer.new
      input = "a:true; b:1; c:example; d:example with whitespace;"
      output = lexer.lex(input)
      expected = [
        "Lex::Token(KEY,a,1,1)",
        "Lex::Token(PARTDELIM,:,1,2)",
        "Lex::Token(VALUE,true,1,3)",
        "Lex::Token(PAIRDELIM,; ,1,7)",
        "Lex::Token(KEY,b,1,9)",
        "Lex::Token(PARTDELIM,:,1,10)",
        "Lex::Token(VALUE,1,1,11)",
        "Lex::Token(PAIRDELIM,; ,1,12)",
        "Lex::Token(KEY,c,1,14)",
        "Lex::Token(PARTDELIM,:,1,15)",
        "Lex::Token(VALUE,example,1,16)",
        "Lex::Token(PAIRDELIM,; ,1,23)",
        "Lex::Token(KEY,d,1,25)",
        "Lex::Token(PARTDELIM,:,1,26)",
        "Lex::Token(VALUE,example with whitespace,1,27)",
        "Lex::Token(PAIRDELIM,;,1,50)"
      ]
      assert output.to_a.map(&:inspect) == expected
    end

  end
end
