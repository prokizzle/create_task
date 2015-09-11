# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'create_task/version'

Gem::Specification.new do |spec|
  spec.name          = 'create_task'
  spec.version       = CreateTask::VERSION
  spec.authors       = ['Nick Prokesch']
  spec.email         = ['nick@prokes.ch']
  spec.summary       = 'Handles task creation for a variety of todo apps'
  spec.description   = 'Creates tasks for omnifocus, things, reminders'
  spec.homepage      = 'https://github.com/prokizzle/create_task'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.require_paths = ['lib']
  spec.bindir = 'bin'
  spec.executables << 'create_task'

  spec.add_dependency 'mechanize', '~> 2.7'
  spec.add_dependency 'amatch', '~> 0.2'
  spec.add_dependency 'rb-appscript', '~> 0.6'
  spec.add_dependency 'highline', '~> 1.6'
  spec.add_dependency 'chronic', '~> 0.10'
  spec.add_dependency 'sqlite3', '~> 1.3'
end
