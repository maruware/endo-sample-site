class User < ActiveRecord::Base
  has_secure_password
  has_many :articles

  before_create do
    if self.token.nil?
      self.token = SecureRandom.hex(10)
    end
  end

end
