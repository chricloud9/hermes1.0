require 'bcrypt'
class User < ActiveRecord::Base
	has_secure_password 
	has_many :drops
	def full_name
		"#{first_name} #{last_name}"
	end
end
