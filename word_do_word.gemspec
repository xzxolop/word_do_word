# wordling.gemspec

Gem::Specification.new do |spec|
  spec.name          = 'wordling'
  spec.version       = '0.1.0'
  spec.authors       = ['Your Name']
  spec.email         = ['your@email.com']
  spec.summary       = 'A Ruby gem for frequency analysis of text files.'
  spec.description   = 'A Ruby gem that analyzes the frequency of words in text files.'
  spec.homepage      = 'https://github.com/yourusername/wordling'
  spec.license       = 'MIT'

  spec.files         = Dir.glob('lib/**/*')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec'
  spec.add_runtime_dependency 'lemmatizer'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.required_ruby_version = '>= 2.5'
end