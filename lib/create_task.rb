require 'yaml'
require 'highline/import'
require 'appscript'
class Appscript::Reference # :nodoc:
  # HACK: There is apparently a bug in ruby 1.9 where if you have
  # method_missing defined and do some action that calls to_ary, then
  # to_ary will be called on your instance REGARDLESS of whether
  # respond_to_(:to_ary) returns true or not.
  #
  # http://tenderlovemaking.com/2011/06/28/til-its-ok-to-return-nil-from-to_ary/

  def to_ary # :nodoc:
    nil
  end
end if RUBY_VERSION >= "1.9"
include Appscript
require 'amatch'
include Amatch
require 'chronic'
require 'mechanize'
require 'open-uri'

# Requires all gem files
module CreateTask
  Dir[File.dirname(__FILE__) + '/create_task/*.rb'].each do |file|
    require file
  end
end
