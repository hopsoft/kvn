require_relative "test_helper"

module Kvn
  class ParserTest < PryTest::Test

    test "parse valid value" do
      value = "a:true; b:1; c:example; d:example with whitespace;"
      expected = {"a"=>"true", "b"=>"1", "c"=>"example", "d"=>"example with whitespace"}
      assert Kvn::Parser.new.parse(value) == expected
    end

    test "parse invalid value" do
      value = "foo:bar; invalid stuff here"
      begin
        Kvn::Parser.new.parse(value)
      rescue Kvn::IllegalCharacterError => e
      end
      assert !e.nil? && e.message == "Illegal character in KVN string! 1:10 i"
    end
  end
end
