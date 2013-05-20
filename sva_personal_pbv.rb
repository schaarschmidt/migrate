
require './sva_connection'

class SvaPersonalPbv < SvaConnection
  self.table_name = 'personal_pbv'
  self.primary_key = 'pbv_pgd_join_id'
end
