[![Lines of Code](http://img.shields.io/badge/lines_of_code-144-brightgreen.svg?style=flat)](http://blog.codinghorror.com/the-best-code-is-no-code-at-all/)
[![Code Status](http://img.shields.io/codeclimate/github/hopsoft/kvn.svg?style=flat)](https://codeclimate.com/github/hopsoft/kvn)
[![Dependency Status](http://img.shields.io/gemnasium/hopsoft/kvn.svg?style=flat)](https://gemnasium.com/hopsoft/kvn)
[![Build Status](http://img.shields.io/travis/hopsoft/kvn.svg?style=flat)](https://travis-ci.org/hopsoft/kvn)
[![Coverage Status](https://img.shields.io/coveralls/hopsoft/kvn.svg?style=flat)](https://coveralls.io/r/hopsoft/kvn?branch=master)
[![Downloads](http://img.shields.io/gem/dt/kvn.svg?style=flat)](http://rubygems.org/gems/kvn)

<a rel="nofollow" href="https://app.codesponsor.io/link/QMSjMHrtPhvfmCnk5Hbikhhr/hopsoft/kvn"><img src="https://app.codesponsor.io/embed/QMSjMHrtPhvfmCnk5Hbikhhr/hopsoft/kvn.svg" style="width: 888px; height: 68px;" alt="Sponsor" /></a>

# KVN (kĕ'vĭn)

## Key/Value Notation

```
name:kvn; pronunciation:kĕ'vĭn; summary:Key/Value Notation;
```

Similar to JSON but narrower in scope.
Represents basic key/value data structures as legible strings.
Useful when working with limited storage options to capture complex data in a single field.

## Rules

* Key & value are delimited with a colon `:`
* Key/value pairs are delimited with a semicolon `;`
* Colons & semicolons are reserved & are prohibited in keys & values
* Data structures should be flat&mdash; 1 level deep, no nesting
* Keys & values are limited to primitive types
  * Boolean
  * String
  * Numeric
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

