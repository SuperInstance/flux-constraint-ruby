Gem::Specification.new do |s|
  s.name = 'flux-constraint'
  s.version = '0.1.0'
  s.summary = 'INT8 constraint checking engine with severity thresholds'
  s.description = <<~DESC
    High-performance constraint checking with INT8 saturation arithmetic
    and configurable severity levels. Supports Automotive, Medical,
    Aerospace, and Industrial process monitoring presets.
    Pure Ruby, no dependencies.
  DESC
  s.authors = ['SuperInstance']
  s.email = 'engineering@superinstance.dev'
  s.license = 'MIT'
  s.homepage = 'https://github.com/SuperInstance/flux-constraint-ruby'
  s.files = Dir['lib/**/*.rb']
  s.required_ruby_version = '>= 3.0'
  s.add_development_dependency 'rspec', '~> 3.12'
end
