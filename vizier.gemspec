# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vizier/version"

Gem::Specification.new do |spec|
  spec.name = "vizier"
  spec.version = Vizier::VERSION
  spec.authors = ["Noah Botimer"]
  spec.email = ["botimer@umich.edu"]
  spec.license = "BSD-3-Clause"

  spec.summary = <<~SUMMARY
    Vizier supports building policy-aware presenters for the view layer of applications,
    especially those using Rails.
  SUMMARY

  spec.description = <<~DESCRIPTION
    Vizier helps you present the right information to your users. By using policies and configurable
    defaults, it becomes easier to build presenters and be sure that model objects are wrapped in
    presenters when they are delivered to view templates.
  DESCRIPTION

  spec.homepage = "https://github.com/mlibrary/vizier"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "simplecov", "~> 0.21"
  spec.add_development_dependency "simplecov-lcov", "~> 0.8"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.11"
  spec.add_development_dependency "standard", "~> 1.7"
end
