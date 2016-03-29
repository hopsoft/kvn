require_relative "test_helper"

module Kvn
  class ConverterTest < PryTest::Test

    test "convert nil value" do
      hash = { a: nil }
      value = Kvn::Converter.new(hash).convert
      assert value == "a:null;"
    end

    test "convert empty value" do
      hash = { a: "" }
      value = Kvn::Converter.new(hash).convert
      assert value == ""
    end

    test "convert valid value" do
      hash = { :b=>1, :a=>true, :d=>"example with whitespace", :c=>"example", :x => 3.14, y: "complex value 21.3" }
      value = Kvn::Converter.new(hash).convert
      expected = "a:true; b:1; c:example; d:example with whitespace; x:3.14; y:complex value 21.3;"
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

  end
end
