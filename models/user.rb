require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
attr_reader :password
attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :email, String, required: true, unique: true
  property :password_digest, Text

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address
  # validates_presence_of :email # not necessary as it is specified in the property
  # validates_uniqueness_of :email # not necessary as it is specified in the property

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
