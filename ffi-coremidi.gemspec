# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffi/coremidi/version'

Gem::Specification.new do |spec|
  spec.name          = "ffi-coremidi"
  spec.version       = "1.0.0"
  spec.authors       = ["Chris Erin"]
  spec.email         = ["chris.erin@gmail.com"]
  spec.summary       = %q{Fork of ffi-coremidi with virtual destination}
  spec.description   = %q{Fork of ffi-coremidi with virtual destination}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
