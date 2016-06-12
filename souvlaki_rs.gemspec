$:.push File.expand_path('../lib', __FILE__)
require 'souvlaki_rs/version'

Gem::Specification.new do |s|
  s.name               = "souvlaki_rs"
  s.version            = SouvlakiRS::VERSION
  s.platform           = Gem::Platform::RUBY
  s.default_executable = "fetch_show"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.authors = ["Ed Porras"]
  s.email = %q{technical@wgot.org}
  s.date = SouvlakiRS::RELEASE_DATE
  s.summary = %q{Tools for managing WGOT-LP's syndicated fetching and import}
  s.description = %q{Scripts for managing auto fech of files and dropbox import}
  s.license = 'MIT'

  s.files = `git ls-files`.split("\n").
               reject{|f| f =~ /\.gem/}.
               reject{|f| f =~ /\.txt/}.
               reject{|f| f =~ /\.edn/}

  s.executables = ['fetch_show']
  s.homepage = %q{http://rubygems.org/gems/souvlaki_rs}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}

  s.add_dependency('edn', '~> 1.1')
  s.add_dependency('taglib-ruby', '~> 0.7')
  s.add_dependency('mechanize', '~> 2.7')
  s.add_dependency('syslogger', '~> 1.6')
  s.add_dependency('ruby-filemagic', '~> 0.7')
  s.add_dependency('listen', '~> 3.0')
  s.add_dependency('mail', '~> 2.6')

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

