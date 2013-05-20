
require 'active_record'
require 'pg'

class SvaConnection < ActiveRecord::Base
  self.abstract_class = true

  self.establish_connection(
    adapter:  'postgresql',
    host:     ENV.fetch('PG_ZUV_HOST'),
    port:     ENV.fetch('PG_ZUV_PORT'),
    username: ENV.fetch('PG_ZUV_USER'),
    password: ENV.fetch('PG_ZUV_PASSWORD'),
    database: ENV.fetch('PG_ZUV_INSTANCE')
  )
end
