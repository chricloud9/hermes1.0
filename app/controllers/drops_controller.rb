class DropsController < ApplicationController
	def index
		@drop = Drop.all
	end

	def new
    	@drop = Drop.new
 	 end

	def create
	  #add the rest of the parameters for our working app LATER
	  drop = Drop.new(params.require(:drop).permit(:spot, :description, :item, :latitude, :longitude, :landmark)) 
	  #which inputs will be allowed in the create controller
	  if drop.save
	    redirect_to drops_path(drop_created: 'true')
	  end
	end

	def show
		@drop = Drop.where(id: params[:id]).first
	end
end
