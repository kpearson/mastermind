gem 'minitest'

require 'minitest/autorun'
require 'minitest/pride'

lib_dir = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib_dir)

require 'cli'