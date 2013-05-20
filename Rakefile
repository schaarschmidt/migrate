# encoding: utf-8

$: << File.expand_path('../lib/models',__FILE__)

require 'active_record'
require 'yaml'
require 'logger'

Dir.glob('lib/tasks/*.rake').each { |rakefile| import rakefile }

namespace :db do
  desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
  task :migrate => :environment do
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
  end
end


namespace :sync do
  task :all => [:pgd, :pbv]
end

task :environment do
  ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml')))
  ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
end

