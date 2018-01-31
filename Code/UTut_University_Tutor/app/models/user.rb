class User < ApplicationRecord
     before_save { self.username = username.downcase }
     validates :username, presence: true, length: { maximum: 50 }
     VALID_NAME_REGEX = /\A(\w)+\z/i
     validates :username, presence: true, length: { maximum: 255 },
                       format: { with: VALID_NAME_REGEX },
                       uniqueness: { case_sensitive: false }
     has_secure_password
     validates :password, length: { minimum: 6 }
end
