# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n_csv/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n_csv"
  spec.version       = I18nCsv::VERSION
  spec.authors       = ["Artem Shoobovych"]
  spec.email         = ["shybovycha@gmail.com"]
  spec.description   = %q{One extends standard I18n so that you could store your translations in a Comma-Separated Value files (CSV) in a key-value manner, where the key is a word or a phrase or even a poem if you wish. No limits here (except be aware to escape symbols so the CSV format is kept). And the value is the same text as the key but translated to a language, specified by a file name you are using (for example, you could write one line to a sp.csv file: `"hello!","hola!"` and use `t 'hello!'` with a spanish locale to get the "hola!" text).}
  spec.summary       = %q{Extends I18n to use Magento-style CSV translation storage.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.rubyforge_project = "i18n_csv"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "i18n"
end
