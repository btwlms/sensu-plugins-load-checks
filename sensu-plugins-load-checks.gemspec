lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'

if RUBY_VERSION < '2.0.0'
  require 'sensu-plugins-load-checks'
else
  require_relative 'lib/sensu-plugins-load-checks'
end

# pvt_key = '~/.ssh/gem-private_key.pem'

Gem::Specification.new do |s|
  s.authors                = ['Sensu-Plugins and contributors']
  # s.cert_chain             = ['certs/sensu-plugins.pem']
  s.date                   = Date.today.to_s
  s.description            = 'This plugin provides native load instrumentation
                              for monitoring and metrics collection, including:
                              load health, and total or per core metrics'
  s.email                  = '<sensu-users@googlegroups.com>'
  s.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w(LICENSE README.md CHANGELOG.md)
  s.homepage               = 'https://github.com/sensu-plugins/sensu-plugins-load-checks'
  s.license                = 'MIT'
  s.metadata               = { 'maintainer'         => '@mattyjones',
                               'development_status' => 'active',
                               'production_status'  => 'unstable - testing reccomended',
                               'release_draft'      => 'false',
                               'release_prerelease' => 'false'
                              }

  s.name                   = 'sensu-plugins-load-checks'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 1.9.3'
  # s.signing_key            = File.expand_path(pvt_key) if $PROGRAM_NAME =~ /gem\z/
  s.summary                = 'Sensu plugins for load checks'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = SensuPluginsLoadChecks::Version::VER_STRING

  s.add_runtime_dependency 'sensu-plugin', '~> 1.2'

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  s.add_development_dependency 'github-markup',             '~> 1.3'
  s.add_development_dependency 'pry',                       '~> 0.10'
  s.add_development_dependency 'rake',                      '~> 10.5'
  s.add_development_dependency 'redcarpet',                 '~> 3.2'
  s.add_development_dependency 'rubocop',                   '~> 0.37'
  s.add_development_dependency 'rspec',                     '~> 3.4'
  s.add_development_dependency 'yard',                      '~> 0.8'
end
