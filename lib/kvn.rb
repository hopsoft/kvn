require "lex"
require "kvn/version"
require "kvn/unsupported_hash_error"
require "kvn/value_lexer"
require "kvn/lexer"
require "kvn/converter"
require "kvn/parser"

module Kvn
  SUPPORTED_VALUE_TYPES = [
    NilClass,
    TrueClass,
    FalseClass,
    Symbol,
    String,
    Integer,
    Fixnum,
    Bignum,
    Float,
    Rational
  ]
end
