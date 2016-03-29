require_relative "../lib/kvn"

module Kvn
  class ParserTest < PryTest::Test

    test "parse valid value" do
      value = "a:true; b:1; c:example; d:example with whitespace;"
      expected = {"a"=>"true", "b"=>"1", "c"=>"example", "d"=>"example with whitespace"}
      assert Kvn::Parser.new.parse(value) == expected
    end

    #test "parse invalid value" do
    #  value = "some random string... foo:bar;baz"
    #  expected = {"a"=>"true", " b"=>"1", " c"=>"example", " d"=>"example with whitespace"}
    #  assert Kvn.parse(value) == expected
    #end
  end
end
