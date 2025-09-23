# -*- encoding: utf-8 -*-
# stub: curses 1.5.3 ruby lib
# stub: ext/curses/extconf.rb

Gem::Specification.new do |s|
  s.name = "curses".freeze
  s.version = "1.5.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/ruby/curses/releases", "documentation_uri" => "https://ruby.github.io/curses/", "homepage_uri" => "https://github.com/ruby/curses", "source_code_uri" => "https://github.com/ruby/curses" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shugo Maeda".freeze, "Eric Hodel".freeze]
  s.date = "1980-01-02"
  s.email = ["shugo@ruby-lang.org".freeze, "drbrain@segment7.net".freeze]
  s.extensions = ["ext/curses/extconf.rb".freeze]
  s.files = ["ext/curses/extconf.rb".freeze]
  s.homepage = "https://github.com/ruby/curses".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.6.7".freeze
  s.summary = "A Ruby binding for curses, ncurses, and PDCurses. curses is an extension library for text UI applications. Formerly part of the Ruby standard library, [curses was removed and placed in this gem][1] with the release of Ruby 2.1.0. (see [ruby/ruby@9c5b2fd][2])".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
end
