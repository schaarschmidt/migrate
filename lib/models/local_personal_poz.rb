
require 'local_postgresql_connection'

class LocalPersonalPoz < LocalPostgresConnection
  self.table_name = 'sva_personal_poz_tbl'
  self.primary_key = 'id'
end
