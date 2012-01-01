
require 'sva_connection'

class SosHissosexp < SvaConnection
  self.table_name = 'hissosexp'
  self.primary_key = 'mlumatrikel'
end
