
require 'local_postgresql_connection'

class LocalKAsbtgv < LocalPostgresConnection
  self.table_name = 'sos_k_abstgv_tbl'
  self.primary_key = 'id'
end
