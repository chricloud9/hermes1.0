class Drop < ActiveRecord::Base
	belongs_to :user
  belongs_to :receiver, class_name: "User", foreign_key: :recipient_id, inverse_of: :drops_waiting
	has_many :photos
end
