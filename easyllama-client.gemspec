# frozen_string_literal: true

require_relative 'lib/easyllama/client/version'

Gem::Specification.new do |spec|
  spec.name = 'easyllama-client'
  spec.version = EasyLlama::Client::VERSION
  spec.authors = ['Vitalii Kashoid']
  spec.email = ['kashoyid@gmail.com']

  spec.summary = 'A Ruby gem for Easy Llama API client.'
  spec.description = 'A Ruby gem for Easy Llama API client.'
  spec.homepage = 'https://rubygems.org/gems/easyllama-client'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.4'

  spec.metadata['source_code_uri'] = 'https://github.com/Kashoid23/easyllama-client.git'

  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'net-http'
end
