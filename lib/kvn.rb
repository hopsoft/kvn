require "kvn/version"
require "kvn/illegal_character_error"
require "kvn/unsupported_hash_error"
require "kvn/converter"
require "kvn/lexer"
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
