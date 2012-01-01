# encoding: utf-8

namespace :sync do
  desc "Syncronize hissosexp"
  task :hissosexp do
    require 'local_hissosexp'
    require 'sos_hissosexp'

    LocalHissosexp.connection.execute "truncate table #{LocalHissosexp.table_name}"

    SosHissosexp.readonly.find_each do |sos|
      l = LocalHissosexp.new

      l.sn              = sos["sn"].to_s.strip || nil
      l.gn              = sos["gn"].to_s.strip || nil
      l.mlupersontype   = sos["mlupersontype"].to_s.strip || nil
      l.mlutitel        = sos["mlutitel"].to_s.strip || nil
      l.mlugeschl       = sos["mlugeschl"].to_s.strip || nil
      l.mlugebdat       = sos["mlugebdat"].to_date || nil
      l.mluorg          = sos["mluorg"].to_s.strip || nil
      l.mlumatrikel     = sos["mlumatrikel"].to_i || 0
      l.mlustudstatus   = sos["mlustudstatus"].to_s.strip || nil
      l.mluhoererstatus = sos["mluhoererstatus"].to_s.strip || nil
      l.mlusemester     = sos["mlusemester"].to_s.strip || 0
      l.mluemail1       = sos["mluemail1"].to_s.strip || nil
      l.mluurzkz        = sos["mluurzkz"].to_s.strip || nil
      l.mlustaat        = sos["mlustaat"].to_s.strip || nil
      l.mluhzbstaat     = sos["mluhzbstaat"].to_s.strip || nil
      l.mlustg1abschl   = sos["mlustg1abschl"].to_s.strip || nil
      l.mlustg1f1       = sos["mlustg1f1"].to_s.strip || nil
      l.mlustg1f1vert   = sos["mlustg1f1vert"].to_s.strip || nil
      l.mlustg1f1fachkz = sos["mlustg1f1fachkz"].to_s.strip || nil
      l.mlustg1f1sem    = sos["mlustg1f1sem"].to_s.strip || 0
      l.mlustg1f1pvers  = sos["mlustg1f1pvers"] || 0
      l.mlustg1f1hs     = sos["mlustg1f1hs"].to_s.strip || nil
      l.mlustg1f2       = sos["mlustg1f2"].to_s.strip || nil
      l.mlustg1f2vert   = sos["mlustg1f2vert"].to_s.strip || nil
      l.mlustg1f2fachkz = sos["mlustg1f2fachkz"].to_s.strip || nil
      l.mlustg1f2sem    = sos["mlustg1f2sem"].to_s.strip || 0
      l.mlustg1f2pvers  = sos["mlustg1f2pvers"] || 0
      l.mlustg1f2hs     = sos["mlustg1f2hs"].to_s.strip || nil
      l.mlustg1f3       = sos["mlustg1f3"].to_s.strip || nil
      l.mlustg1f3vert   = sos["mlustg1f3vert"].to_s.strip || nil
      l.mlustg1f3fachkz = sos["mlustg1f3fachkz"].to_s.strip || nil
      l.mlustg1f3sem    = sos["mlustg1f3sem"].to_s.strip || 0
      l.mlustg1f3pvers  = sos["mlustg1f3pvers"] || 0
      l.mlustg1f3hs     = sos["mlustg1f3hs"].to_s.strip || nil
      l.mlustg1f4       = sos["mlustg1f4"].to_s.strip || nil
      l.mlustg1f4vert   = sos["mlustg1f4vert"].to_s.strip || nil
      l.mlustg1f4fachkz = sos["mlustg1f4fachkz"].to_s.strip || nil
      l.mlustg1f4sem    = sos["mlustg1f4sem"].to_s.strip || 0
      l.mlustg1f4pvers  = sos["mlustg1f4pvers"] || 0
      l.mlustg1f4hs     = sos["mlustg1f4hs"].to_s.strip || nil
      l.mlustg1f5       = sos["mlustg1f5"].to_s.strip || nil
      l.mlustg1f5vert   = sos["mlustg1f5vert"].to_s.strip || nil
      l.mlustg1f5fachkz = sos["mlustg1f5fachkz"].to_s.strip || nil
      l.mlustg1f5sem    = sos["mlustg1f5sem"].to_s.strip || 0
      l.mlustg1f5pvers  = sos["mlustg1f5pvers"] || 0
      l.mlustg1f5hs     = sos["mlustg1f5hs"].to_s.strip || nil
      l.mlustg1f6       = sos["mlustg1f6"].to_s.strip || nil
      l.mlustg1f6vert   = sos["mlustg1f6vert"].to_s.strip || nil
      l.mlustg1f6fachkz = sos["mlustg1f6fachkz"].to_s.strip || nil
      l.mlustg1f6sem    = sos["mlustg1f6sem"].to_s.strip || 0
      l.mlustg1f6pvers  = sos["mlustg1f6pvers"] || 0
      l.mlustg1f6hs     = sos["mlustg1f6hs"].to_s.strip || nil
      l.mlustg1f7       = sos["mlustg1f7"].to_s.strip || nil
      l.mlustg1f7vert   = sos["mlustg1f7vert"].to_s.strip || nil
      l.mlustg1f7fachkz = sos["mlustg1f7fachkz"].to_s.strip || nil
      l.mlustg1f7sem    = sos["mlustg1f7sem"].to_s.strip || 0
      l.mlustg1f7pvers  = sos["mlustg1f7pvers"] || 0
      l.mlustg1f7hs     = sos["mlustg1f7hs"].to_s.strip || nil
      l.mlustg1f8       = sos["mlustg1f8"].to_s.strip || nil
      l.mlustg1f8vert   = sos["mlustg1f8vert"].to_s.strip || nil
      l.mlustg1f8fachkz = sos["mlustg1f8fachkz"].to_s.strip || nil
      l.mlustg1f8sem    = sos["mlustg1f8sem"].to_s.strip || 0
      l.mlustg1f8pvers  = sos["mlustg1f8pvers"] || 0
      l.mlustg1f8hs     = sos["mlustg1f8hs"].to_s.strip || nil

      l.mlustg2abschl   = sos["mlustg2abschl"].to_s.strip || nil
      l.mlustg2f1       = sos["mlustg2f1"].to_s.strip || nil
      l.mlustg2f1vert   = sos["mlustg2f1vert"].to_s.strip || nil
      l.mlustg2f1fachkz = sos["mlustg2f1fachkz"].to_s.strip || nil
      l.mlustg2f1sem    = sos["mlustg2f1sem"].to_s.strip || 0
      l.mlustg2f1pvers  = sos["mlustg2f1pvers"] || 0
      l.mlustg2f1hs     = sos["mlustg2f1hs"].to_s.strip || nil
      l.mlustg2f2       = sos["mlustg2f2"].to_s.strip || nil
      l.mlustg2f2vert   = sos["mlustg2f2vert"].to_s.strip || nil
      l.mlustg2f2fachkz = sos["mlustg2f2fachkz"].to_s.strip || nil
      l.mlustg2f2sem    = sos["mlustg2f2sem"].to_s.strip || 0
      l.mlustg2f2pvers  = sos["mlustg2f2pvers"] || 0
      l.mlustg2f2hs     = sos["mlustg2f2hs"].to_s.strip || nil
      l.mlustg2f3       = sos["mlustg2f3"].to_s.strip || nil
      l.mlustg2f3vert   = sos["mlustg2f3vert"].to_s.strip || nil
      l.mlustg2f3fachkz = sos["mlustg2f3fachkz"].to_s.strip || nil
      l.mlustg2f3sem    = sos["mlustg2f3sem"].to_s.strip || 0
      l.mlustg2f3pvers  = sos["mlustg2f3pvers"] || 0
      l.mlustg2f3hs     = sos["mlustg2f3hs"].to_s.strip || nil
      l.mlustg2f4       = sos["mlustg2f4"].to_s.strip || nil
      l.mlustg2f4vert   = sos["mlustg2f4vert"].to_s.strip || nil
      l.mlustg2f4fachkz = sos["mlustg2f4fachkz"].to_s.strip || nil
      l.mlustg2f4sem    = sos["mlustg2f4sem"].to_s.strip || 0
      l.mlustg2f4pvers  = sos["mlustg2f4pvers"] || 0
      l.mlustg2f4hs     = sos["mlustg2f4hs"].to_s.strip || nil
      l.mlustg2f5       = sos["mlustg2f5"].to_s.strip || nil
      l.mlustg2f5vert   = sos["mlustg2f5vert"].to_s.strip || nil
      l.mlustg2f5fachkz = sos["mlustg2f5fachkz"].to_s.strip || nil
      l.mlustg2f5sem    = sos["mlustg2f5sem"].to_s.strip || 0
      l.mlustg2f5pvers  = sos["mlustg2f5pvers"] || 0
      l.mlustg2f5hs     = sos["mlustg2f5hs"].to_s.strip || nil
      l.mlustg2f6       = sos["mlustg2f6"].to_s.strip || nil
      l.mlustg2f6vert   = sos["mlustg2f6vert"].to_s.strip || nil
      l.mlustg2f6fachkz = sos["mlustg2f6fachkz"].to_s.strip || nil
      l.mlustg2f6sem    = sos["mlustg2f6sem"].to_s.strip || 0
      l.mlustg2f6pvers  = sos["mlustg2f6pvers"] || 0
      l.mlustg2f6hs     = sos["mlustg2f6hs"].to_s.strip || nil
      l.mlustg2f7       = sos["mlustg2f7"].to_s.strip || nil
      l.mlustg2f7vert   = sos["mlustg2f7vert"].to_s.strip || nil
      l.mlustg2f7fachkz = sos["mlustg2f7fachkz"].to_s.strip || nil
      l.mlustg2f7sem    = sos["mlustg2f7sem"].to_s.strip || 0
      l.mlustg2f7pvers  = sos["mlustg2f7pvers"] || 0
      l.mlustg2f7hs     = sos["mlustg2f7hs"].to_s.strip || nil
      l.mlustg2f8       = sos["mlustg2f8"].to_s.strip || nil
      l.mlustg2f8vert   = sos["mlustg2f8vert"].to_s.strip || nil
      l.mlustg2f8fachkz = sos["mlustg2f8fachkz"].to_s.strip || nil
      l.mlustg2f8sem    = sos["mlustg2f8sem"].to_s.strip || 0
      l.mlustg2f8pvers  = sos["mlustg2f8pvers"] || 0
      l.mlustg2f8hs     = sos["mlustg2f8hs"].to_s.strip || nil

      l.qis_pw          = sos["qis_pw"].to_s.strip || nil
      l.chip_seriennr   = sos["chip_seriennr"].to_s.strip || nil



      begin
        l.save
      rescue
        puts "#{l.mlumatrikel} fehlgeschlagen"
      end
    end
  end
end
