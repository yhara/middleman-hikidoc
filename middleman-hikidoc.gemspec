# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-hikidoc/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-hikidoc"
  spec.version       = Middleman::Hikidoc::VERSION
  spec.authors       = ["yhara"]
  spec.email         = ["yutaka.hara.gmail.com"]
  spec.description   = %q{Add HikiDoc support for middleman (converts *.hd to *.html)}
  spec.summary       = %q{Add HikiDoc support for middleman}
  spec.homepage      = "https://github.com/yhara/middleman-hikidoc"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "hikidoc", "~> 0.0.6"
  spec.add_development_dependency "middleman-core", "~> 3.1.0"
end
