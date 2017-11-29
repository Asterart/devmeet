class ConferencesController < ApplicationController

	def home
		
	#		@conferences = Conference.all

			if params[:search]
				@conferences = Conference.search(params[:search])
			else
				#@conferences = Conference.all
			end

			@conferences = Conference.order("Conf_date")

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
			flash[:success] = "Conference details added and are waiting for acceptation"
			redirect_to root_url
		else
			flash[:warning] = "Ups something goes wrong, check details and try again"
			render 'new'
		end
	end

	def meetupdata
		api_params = {category: '34',
							lat: '52',
							lon: '19',
							radius: '250',
							status: 'upcoming',
							format: 'json',
							page: '20'}

		meetup_api = MeetupApi.new
		@open_events = meetup_api.open_events(api_params)

		@open_events["results"].each do |e|
			temp = e["time"].to_s[0..9]
			temp2 = Time.at(temp.to_i).utc
			details = HashWithIndifferentAccess.new(e["venue"])
			if details["city"].present?
				details["city"]
			end
			if details["address_1"].present? || details["address_2"].present? || details["address_3"].present?
				address = details["address_1"].to_s << details["address_2"].to_s << details["address_3"].to_s
			end
			if details["localized_country_name"].present?
				details["localized_country_name"]
			end
			e["name"].html_safe
			e["description"].html_safe unless e["description"].blank?
			
			if Conference.exists?(Prog_lang: e["name"].html_safe)
				#place for checking if date of conf is < today's date
				#if yes then delete from database otherwise skip this and
				#focus on adding non existing ones
			else
				Conference.create(Conf_date: "#{temp2}", Street: "#{address}", City: details['city'],
					Country: details['localized_country_name'], Prog_lang: e['name'],
					Short_desc: e["description"].html_safe,
					Date_of_accept: Time.now.utc)
			end
		end
	end

	private

  	def conference_params
  		params.require(:conference).permit(:Conf_date, :Street, :City, :Country, :Prog_lang, :Short_desc)
  	end


end
