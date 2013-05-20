
namespace :sync do
  desc "Syncronize sva_personal_pbv_tbl"
  task :pbv do
    require 'local_personal_pbv'
    require 'sva_personal_pbv'

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
end
