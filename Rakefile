# encoding: utf-8

require 'active_record'
require 'yaml'
require 'logger'

namespace :db do
  desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
  task :migrate => :environment do
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
  end
end

namespace :sync do
  desc "Syncronize sva_personal_pgd_tbl"
  task :pgd do
    require './local_personal_pgd'
    require './sva_personal_pgd'

    LocalPersonalPgd.connection.execute "truncate table #{LocalPersonalPgd.table_name}"

    SvaPersonalPgd.readonly.find_each do |sva|
      l = LocalPersonalPgd.new

      l.pgd_join_id = sva["pgd_join_id"].to_i || 0
      l.pgd_name = sva["pgd_name"].to_s.encode('UTF-8') || nil
      l.pgd_vorname = sva["pgd_vorname"].to_s.encode('UTF-8') || nil
      l.pgd_geburtsdatum = sva["pgd_geburtsdatum"] || nil
      l.pgd_geschlecht = sva["pgd_geschlecht"] || nil
      l.pgd_titel = sva["pgd_titel"].to_s || nil
      l.pgd_endedatum = sva["pgd_endedatum"] || nil

      begin
        l.save
      rescue
        puts "#{l.pgd_join_id} fehlgeschlagen"
      end
    end
  end

  desc "Syncronize sva_personal_pbv_tbl"
  task :pbv do
    require './local_personal_pbv'
    require './sva_personal_pbv'

    LocalPersonalPbv.connection.execute "truncate table #{LocalPersonalPbv.table_name}"

    SvaPersonalPbv.readonly.find_each do |sva|
      l = LocalPersonalPbv.new

      l.pbv_pgd_join_id = sva["pbv_pgd_join_id"].to_i || 0
      l.pbv_nr = sva["pbv_nr"].to_s || 0
      l.pbv_dienstart = sva["pbv_dienstart"].to_s || nil
      l.pbv_flag = sva["pbv_flag"] || nil
      l.pbv_lehrende = sva["pbv_lehrende"] || nil

      begin
        l.save
      rescue
        puts "#{l.pbv_pgd_join_id} fehlgeschlagen"
      end
    end
  end

  task :all => [:pgd, :pbv]
end

task :environment do
  ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml')))
  ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
end

