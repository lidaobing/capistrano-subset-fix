# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/subset/fix/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-subset-fix"
  spec.version       = Capistrano::Subset::Fix::VERSION
  spec.authors       = ["LI Daobing"]
  spec.email         = ["lidaobing@gmail.com"]
  spec.description   = %q{fix capistrano block when use max_hosts}
  spec.summary       = %q{fix capistrano block when use max_hosts}
  spec.homepage      = "https://github.com/lidaobing/capistrano-subset-fix"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '~> 2.0'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
