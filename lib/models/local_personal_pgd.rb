
require 'local_mysql_connection'

class LocalPersonalPgd < LocalMysqlConnection
  self.table_name = 'sva_personal_pgd_tbl'
end
