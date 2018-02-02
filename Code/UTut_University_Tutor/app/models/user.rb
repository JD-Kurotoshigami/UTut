class User < ApplicationRecord
     before_save { self.username = username.downcase }
     validates :username, presence: true, length: { maximum: 50 }
     validates :firstname, presence: true, length: { maximum: 50 }
     validates :lastname, presence: true, length: { maximum: 50 }
     VALID_USERNAME_REGEX = /\A(\w)+\z/i
     VALID_REALNAME_REGEX = /\A[a-zA-Z]([a-zA-Z\ ])*\Z/i
     validates :username, presence: true, length: { maximum: 255 },
                       format: { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false }
     validates :firstname, presence: true, length: { maximum: 255 },
                       format: { with: VALID_REALNAME_REGEX },
                       uniqueness: { case_sensitive: false }
     validates :lastname, presence: true, length: { maximum: 255 },
                       format: { with: VALID_REALNAME_REGEX },
                       uniqueness: { case_sensitive: false }

     has_secure_password
     validates :password, length: { minimum: 6 }
end
