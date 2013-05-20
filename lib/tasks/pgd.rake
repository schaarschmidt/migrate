
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
end
