# -*- encoding: utf-8 -*-
# stub: ocra 1.3.11 ruby lib

Gem::Specification.new do |s|
  s.name = "ocra".freeze
  s.version = "1.3.11".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/larsch/ocra/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lars Christensen".freeze]
  s.date = "2020-03-22"
  s.description = "OCRA (One-Click Ruby Application) builds Windows executables from Ruby\nsource code. The executable is a self-extracting, self-running\nexecutable that contains the Ruby interpreter, your source code and\nany additionally needed ruby libraries or DLL.".freeze
  s.email = ["larsch@belunktum.dk".freeze]
  s.executables = ["ocra".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.md".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze, "README.md".freeze, "bin/ocra".freeze]
  s.homepage = "https://github.com/larsch/ocra/".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "OCRA (One-Click Ruby Application) builds Windows executables from Ruby source code".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.14".freeze])
  s.add_development_dependency(%q<rdoc>.freeze, [">= 4.0".freeze, "< 7".freeze])
  s.add_development_dependency(%q<hoe>.freeze, ["~> 3.22".freeze])
end
