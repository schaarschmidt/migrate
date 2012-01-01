
require 'local_postgresql_connection'

class LocalHissosexp < LocalPostgresConnection
  self.table_name = 'sos_hissosexp_tbl'
  self.primary_key = 'id'
end
