
namespace :sync do
  desc "Syncronize sva_personal_poz_tbl"
  task :poz do
    require 'local_personal_poz'
    require 'sva_personal_poz'

    LocalPersonalPoz.connection.execute "truncate table #{LocalPersonalPoz.table_name}"

    SvaPersonalPoz.readonly.find_each do |sva|
      l = LocalPersonalPoz.new

      l.poz_pgd_join_id = sva["poz_pgd_join_id"].to_i || 0
      l.poz_pbv_nr = sva["poz_pbv_nr"].to_i || 0
      l.poz_institut = sva["poz_institut"].to_s || nil
      l.poz_prozent = sva["poz_prozent"] || 0

      begin
        l.save
      rescue
        puts "#{l.poz_pgd_join_id} fehlgeschlagen"
      end
    end
  end
end
