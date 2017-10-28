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
		@conference = Conference.find(params[:id])
		@conference.update_attribute(:Date_of_reject, Time.now)
		@conference.update_attribute(:Date_of_accept, nil)

		flash[:success] = "Conference declined"
		redirect_to manage_url

	end

	def accept
		@conference = Conference.find(params[:id])
		@conference.update_attribute(:Date_of_accept, Time.now)
		@conference.update_attribute(:Date_of_reject, nil)

		flash[:success] = "Conference accepted"
		redirect_to manage_url
	end

	def destroy
		Conference.find(params[:id]).destroy
		flash[:success] = "Conference details deleted"
		redirect_to root_url
	end


	private

  	def conference_params
  		params.require(:conference).permit(:Conf_date, :Street, :City, :Country, :Prog_lang, :Short_desc)
  	end

end


