
require 'local_postgresql_connection'

class LocalPersonalPbv < LocalPostgresConnection
  self.table_name = 'sva_personal_pbv_tbl'
  self.primary_key = 'id'
end
