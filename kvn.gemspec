# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kvn/version'

Gem::Specification.new do |spec|
  spec.name          = "kvn"
  spec.version       = Kvn::VERSION
  spec.authors       = ["Nathan Hopkins"]
  spec.email         = ["natehop@gmail.com"]

  spec.summary       = %q{KVN key/value notation converter & parser}
  spec.homepage      = "https://github.com/hopsoft/kvn"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb", "[A-Z]*"]
  spec.require_paths = ["lib"]

  spec.add_dependency "lex", "0.1.0"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-test"
  spec.add_development_dependency "coveralls"
end
