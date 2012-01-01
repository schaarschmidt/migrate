
require 'active_record'
require 'mysql2'

class LocalMysqlConnection < ActiveRecord::Base
  self.abstract_class = true

  self.establish_connection(
    adapter:  'mysql2',
    host:     'localhost',
    socket:   '/tmp/mysql.sock',
    username: 'root',
    password: 'geheim',
    database: 'testdb',
    encoding: 'utf8'
  )

end

