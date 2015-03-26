require 'bcrypt'
class User < ActiveRecord::Base
	has_secure_password 
	has_many :drops
  has_many :drops_waiting, class_name: "Drop", foreign_key: :recipient_id, inverse_of: :receiver
	def full_name
		"#{first_name} #{last_name}"
	end
end
