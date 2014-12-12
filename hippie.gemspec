Gem::Specification.new do |s|
  s.name          = 'hippie'
  s.version       = '0.5.1'
  s.summary       = 'Simple HTTP'
  s.description   = 'Simple wrapper for Net::HTTP'
  s.author        = 'Martin Manelli'
  s.email         = 'manelli.ml@gmail.com'
  s.homepage      = 'http://github.com/manelli/hippie'
  s.license       = 'MIT'
  s.require_paths = ['lib']

  s.files = Dir[
    'LICENSE',
    'README.md',
    'makefile',
    'lib/hippie.rb',
    'lib/cacert.pem',
    'lib/hippie/response.rb',
    'tests/hippie_test.rb',
    'hippie.gemspec'
  ]

  s.add_development_dependency 'cutest', '~> 1.2', '>= 1.2.0'
end
