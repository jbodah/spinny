# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spinny/version'

Gem::Specification.new do |spec|
  spec.name          = "spinny_rb"
  spec.version       = Spinny::VERSION
  spec.authors       = ["Josh Bodah"]
  spec.email         = ["jb3689@yahoo.com"]

  spec.summary       = %q{a lightweight, unopinionated ruby application pre-loader}
  spec.description   = %q{
Spinny is influenced by projects like Spring and Spin and tries to make your workflow more efficient.
It differs from those projects in the sense that it is designed to be lighter and does not try to
create special cases for certain technologies like Rails or particular test runners.
}
  spec.homepage      = "https://github.com/jbodah/spinny_rb"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "listen", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
