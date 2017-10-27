class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def manage
		#@conferences = Conference.all
		

			if params[:search]
				@conferences = Conference.search(params[:search])
			else
				@conferences = Conference.all
			end

			@conferences = Conference.order("Conf_date")

			respond_to do |f|
				f.html
				f.xml { render :xml => @conferences }
			end
	end

	def decline
		conference = Conference.find(params[:id])
		redirect_to root_url

	end





	private

  	def conference_params
  		params.require(:conference).permit(:Conf_date, :Street, :City, :Country, :Prog_lang, :Short_desc)
  	end

end


