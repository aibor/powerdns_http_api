# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'powerdns_http_api'

Gem::Specification.new do |spec|
  spec.name          = "powerdns_http_api"
  spec.version       = PowerdnsHttpApi::VERSION
  spec.authors       = ["Tobias Böhm"]
  spec.email         = ["code@aibor.de"]
  spec.summary       = %q{PowerDNS experimental HTTP JSON API library.}
  spec.description   = %q{This library provides an interface for the
                          still experimental PowerDNS HTTP JSON API. }
  spec.homepage      = "https://github.com/aibor/powernds_http_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "redcarpet"

  spec.add_dependency "activeresource"
end
