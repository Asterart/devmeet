class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def manage
		@conferences = Conference.all

			if params[:search]
				@conferences = Conference.search(params[:search])
			else
				@conferences = Conference.all
			end

			respond_to do |f|
				f.html
				f.xml { render :xml => @conferences }
			end
	end
end
