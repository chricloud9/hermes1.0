class DropsController < ApplicationController
	def index
		@drops = Drop.where(recipient_id: current_user.id)
	end

	def new
    	@drop = Drop.new
 	 end

	def create
	  #add the rest of the parameters for our working app LATER
	  drop = current_user.drops.new(params.require(:drop).permit(:spot, :description, :item, :latitude, :longitude, :landmark, :recipient_id)) 
	  #which inputs will be allowed in the create controller
	  drop.recipient_id = 
	  if drop.save

	    redirect_to drops_path(drop_created: 'true')

	  end
	end

	def show
		@drop = Drop.where(id: params[:id]).first
	end
end
