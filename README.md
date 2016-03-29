[![Lines of Code](http://img.shields.io/badge/lines_of_code-145-brightgreen.svg?style=flat)](http://blog.codinghorror.com/the-best-code-is-no-code-at-all/)
[![Code Status](http://img.shields.io/codeclimate/github/hopsoft/kvn.svg?style=flat)](https://codeclimate.com/github/hopsoft/kvn)
[![Dependency Status](http://img.shields.io/gemnasium/hopsoft/kvn.svg?style=flat)](https://gemnasium.com/hopsoft/kvn)
[![Build Status](http://img.shields.io/travis/hopsoft/kvn.svg?style=flat)](https://travis-ci.org/hopsoft/kvn)
[![Coverage Status](https://img.shields.io/coveralls/hopsoft/kvn.svg?style=flat)](https://coveralls.io/r/hopsoft/kvn?branch=master)
[![Downloads](http://img.shields.io/gem/dt/kvn.svg?style=flat)](http://rubygems.org/gems/kvn)

# KVN (kevin)

## Key/Value Notation

Similar to JSON but more limited in scope.
Can be used to represent basic key/value data structures as (human readable) strings.

Useful when working with limited storage options
to capture additional (human readable) data in a single field.

## Rules

* Data structures should be flat (i.e. 1 level deep, no nesting)
* Keys & values are limited to primitive types

  * String
  * Numeric
  * Boolean
  * Null

* Colons & semicolons are prohibited in keys & values
* Keys are sorted alphabetically

## Examples

### Convert a Hash to a KVN string

```ruby
data = { d: "example with whitespace", a: true, c: "example", b: 1, e: nil }
Kvn::Converter.new(data).convert
# => "a:true; b:1; c:example; d:example with whitespace; e:null;"
```

### Parse a KVN string into a Hash

```ruby
value = "a:true; b:1; c:example; d:example with whitespace; e:null;"
Kvn::Parser.new(value).parse
# => {"a"=>true, "b"=>1, "c"=>"example", "d"=>"example with whitespace", "e"=>nil}
```

