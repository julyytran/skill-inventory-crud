require 'bundler'
Bundler.require
require File.expand_path('../config/environment',  __FILE__)
#
# $LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/app"))
#
# require 'controllers/skill_inventory_app'

run SkillInventoryApp
