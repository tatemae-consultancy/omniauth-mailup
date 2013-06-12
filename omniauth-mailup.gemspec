# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-mailup/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-mailup"
  gem.version       = Omniauth::MailUp::VERSION
  gem.authors       = ["Brian Getting"]
  gem.email         = ["brian@tatem.ae"]
  gem.description   = %q{MailUp OAuth2 Strategy for OmniAuth 1.0.}
  gem.summary       = %q{OAuth2 Strategy for OmniAuth 1.0 for connecting to the MailUp REST API.}
  gem.homepage      = "https://github.com/tatemae-consultancy/omniauth-mailup"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.0'
  gem.add_runtime_dependency 'multi_json', '~> 1.7.3'
  
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
end
