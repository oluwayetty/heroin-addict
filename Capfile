# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
require 'capistrano/rails'
require 'capistrano/rails/db'
require 'capistrano/bundler'
require 'capistrano/rbenv'
require 'capistrano/puma'
require 'capistrano/figaro_yml'
install_plugin Capistrano::Puma
# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
