# KVN (kevin)

## Key/Value Notation

Similar to JSON but more limited in scope.
Can be used to represent basic key/value data structures as human readable strings.

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
data = { d: "example with whitespace", a: true, c: "example", b: 1 }
Kvn::Converter.new(data).convert
# => "a:true; b:1; c:example; d:example with whitespace;"
```

### Parse a KVN string into a Hash

```ruby
value = "a:true; b:1; c:example; d:example with whitespace;"
Kvn::Parser.new(value).parse
# => {"a"=>"true", "b"=>"1", "c"=>"example", "d"=>"example with whitespace"}
```
