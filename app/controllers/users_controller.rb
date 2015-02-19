class UsersController < ApplicationController
 
  def index

  end

  def user_params
   params.require(:user).permit(:email, :avatar)
  end
  def new
    @user = User.new
  end

  def create
  	#add the rest of the parameters for our working app LATER
    user = User.new(params.require(:user).permit(:first_name, :email, :password)) #which inputs will be allowed in the create controller
    if user.save
      redirect_to new_sessions_path(user_created: 'true') #someone logs in here
    end
  end

  def show
    @user = User.find(session['user_id'])
  end
end