require_relative "test_helper"

module Kvn
  class ConverterTest < PryTest::Test

    test "convert valid value" do
      hash = { :b=>1, :a=>true, :d=>"example with whitespace", :c=>"example" }
      value = Kvn::Converter.new(hash).convert
      expected = "a:true; b:1; c:example; d:example with whitespace;"
      assert value == expected
    end

    test "convert unsupported value" do
      value = Kvn::Converter.new("not a kvn string").convert
      assert value == ""
    end

    test "convert nested hash raises" do
      begin
        Kvn::Converter.new({a: true, b: { c: false } }).convert
      rescue Kvn::UnsupportedHashError => e
      end
      assert e
    end

    test "convert nested array raises" do
      begin
        Kvn::Converter.new({a: true, b: [false] }).convert
      rescue Kvn::UnsupportedHashError => e
      end
      assert e
    end

    test "demo" do
value = "a:true; b:1; c:example; d:example with whitespace;"
p = Kvn::Parser.new(value).parse
assert p == false
    end

  end
end
