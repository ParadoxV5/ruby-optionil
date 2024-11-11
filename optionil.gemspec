# frozen_string_literal: true

Gem::Specification.new do|spec|
  spec.name = 'optionil'
  spec.summary = 'Automatically apply the Optional pattern to all APIs globally, including the Ruby Corelib!'
  spec.version = '1.0.1'
  spec.author = 'ParadoxV5'
  spec.license = 'WTFPL'
  
  github = "https://github.com/#{spec.author}/ruby-#{spec.name}"
  spec.metadata = {
    'homepage_uri'      => spec.homepage = github,
    'changelog_uri'     => File.join(github, 'commits'),
    'bug_tracker_uri'   => File.join(github, 'discussions'),
  }
  
  spec.files = Dir['**/*']
  spec.required_ruby_version = '>= 2.7'
end
