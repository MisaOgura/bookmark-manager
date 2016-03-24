require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :address, String
  property :password, String

  has n, :links, :through => Resource
end
