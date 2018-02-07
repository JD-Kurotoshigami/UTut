# class PasswordValidator < ActiveModel::Validator
#   def validate(record)
#     if record.password == nil || record.password[:length] < 5
#       record.errors[:base] << "len < 5"
#     end
#   end
# end
class User < ApplicationRecord
     before_save { self.username = username.downcase }
     VALID_USERNAME_REGEX = /\A(\w)+\z/i
     VALID_REALNAME_REGEX = /\A([a-zA-Z]([a-zA-Z\ \-])*[^ \d\-])\Z/i
     validates :username, length: { maximum: 64 },
                       format: { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false }
     validates :firstname, length: { maximum: 64 },
                       format: { with: VALID_REALNAME_REGEX }
     validates :lastname, length: { maximum: 64 },
                       format: { with: VALID_REALNAME_REGEX }
     validates :sex, presence: true
     has_secure_password
     validates :password, length: { minimum: 5, message: "is too short" }
     #validates_with PasswordValidator, fields: [:password]
end

