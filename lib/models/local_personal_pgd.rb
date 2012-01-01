
require 'local_postgresql_connection'

class LocalPersonalPgd < LocalPostgresConnection
  self.table_name = 'sva_personal_pgd_tbl'
end
