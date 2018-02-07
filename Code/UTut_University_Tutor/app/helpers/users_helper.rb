module UsersHelper
	class PasswordValidator < ActiveModel::Validator
		def validate(record)
			if record.length < 5
				record.errors[:base] << "len < 5"
			end
		end
	end
end
