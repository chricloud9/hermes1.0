require 'rails_helper'

RSpec.describe User, type: :model do
	it "should allow a user to log in" do
		u = User.create(email: "someone@somewhere.com", password: "pass123")
		login_attempt = u.authenticate("pass123")
		expect(login_attempt).to be_an_instance_of(User)
	end
end