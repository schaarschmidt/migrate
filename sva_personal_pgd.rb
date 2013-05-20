
require 'active_record'
require 'pg'

class SvaPersonalPgd < ActiveRecord::Base
  self.establish_connection(
    adapter:  'postgresql',
    host:     ENV.fetch('PG_ZUV_HOST'),
    port:     ENV.fetch('PG_ZUV_PORT'),
    username: ENV.fetch('PG_ZUV_USER'),
    password: ENV.fetch('PG_ZUV_PASSWORD'),
    database: ENV.fetch('PG_ZUV_INSTANCE')
  )

  self.table_name = 'personal_pgd'
  self.primary_key = 'pgd_join_id'
end
