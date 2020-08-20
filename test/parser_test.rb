# frozen_string_literal: true

require_relative "test_helper"

module Kvn
  class ParserTest < PryTest::Test
    test "parse true value" do
      value = "a:true;"
      expected = {"a" => true}
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse false value" do
      value = "a:false;"
      expected = {"a" => false}
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse null value" do
      value = "a:null;"
      expected = {"a" => nil}
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse null value" do
      value = "a:null;"
      expected = {"a" => nil}
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse integer value" do
      value = "a:432;"
      expected = {"a" => 432}
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse float value" do
      value = "a:3.14;"
      expected = {"a" => 3.14}
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse string value" do
      value = "a:basic;"
      expected = {"a" => "basic"}
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse string with whitespace value" do
      value = "a:string with whitespace;"
      expected = {"a" => "string with whitespace"}
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse complex value" do
      value = "a:string with whitespace and number 3.14;"
      expected = {"a" => "string with whitespace and number 3.14"}
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse complex value 2" do
      value = "agent:Ashley; host:www.foo.com; name:click; partner:ExampleService; target:www.bar.com; type:primary-site-link; utm_content:baz-001; utm_medium:foo-bar-baz-test; utm_source:500409; value:0.13;"
      expected = {
        "agent" => "Ashley",
        "host" => "www.foo.com",
        "name" => "click",
        "partner" => "ExampleService",
        "target" => "www.bar.com",
        "type" => "primary-site-link",
        "utm_content" => "baz-001",
        "utm_medium" => "foo-bar-baz-test",
        "utm_source" => 500409,
        "value" => 0.13
      }
      parsed = Kvn::Parser.new(value).parse
      assert parsed == expected
    end

    test "parse multiple valid values" do
      value = "a:true; b:1; c:example; d:example with whitespace; e:null; f:0.1;"
      expected = {"a" => true, "b" => 1, "c" => "example", "d" => "example with whitespace", "e" => nil, "f" => 0.1}
      assert Kvn::Parser.new(value).parse == expected
    end

    test "parse malformed value (missing key)" do
      value = "foo:bar; invalid stuff here;"
      begin
        Kvn::Parser.new(value).parse
      rescue SyntaxError => e
      end
      assert e
      assert e.message == "Empty key detected for value! <invalid stuff here>"
    end

    test "parse malformed missing value" do
      value = "a:;"
      begin
        Kvn::Parser.new(value).parse
      rescue SyntaxError => e
      end
      assert e
      assert e.message == "Empty value detected for key! <a>"
    end

    test "parse malformed value" do
      value = "foo:bar; invalid stuff here"
      begin
        Kvn::Parser.new(value).parse
      rescue SyntaxError => e
      end
      assert e
      assert e.message == "Illegal character in KVN string! 1:10 <i>"
    end

    test "parse empty string" do
      parsed = Kvn::Parser.new("").parse
      assert parsed == {}
    end
  end
end
