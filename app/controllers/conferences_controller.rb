class ConferencesController < ApplicationController

	def home
		
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

	def new
		@conference = Conference.new
	end

	def create
		@conference = Conference.new(conference_params)
		if @conference.save
			redirect_to root_url
		else
			render 'new'
		end
	end


	private

  	def conference_params
  		params.require(:conference).permit(:Conf_date, :Street, :City, :Country, :Prog_lang, :Short_desc)
  	end


end
