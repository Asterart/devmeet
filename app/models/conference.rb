class Conference < ApplicationRecord
	validates_presence_of :Street, :City, :Country, :Prog_lang
	validates_length_of :Short_desc, :maximum => 250


	def self.search(search)
		where("Prog_lang LIKE ? OR City LIKE ? OR Country LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end
