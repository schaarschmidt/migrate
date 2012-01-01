
require 'sva_connection'

class SvaPersonalPoz < SvaConnection
  self.table_name = 'personal_poz'
  self.primary_key = 'poz_pgd_join_id'
end
