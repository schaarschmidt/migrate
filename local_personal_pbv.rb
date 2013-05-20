
require './local_mysql_connection'

class LocalPersonalPbv < LocalMysqlConnection
  self.table_name = 'sva_personal_pbv_tbl'
  self.primary_key = 'id'
end
