
require 'active_record'
require 'pg'

class LocalPostgresConnection < ActiveRecord::Base
  self.abstract_class = true

  self.establish_connection(
    adapter:  'postgresql',
    host:     'localhost',
    #socket:   '/tmp/mysql.sock',
    username: 'nmaef',
    password: 'geheim',
    database: 'owner_development',
    encoding: 'unicode'
  )

end

