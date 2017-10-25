# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#mainAdminUser = Admin.new(
 #   email: "me@devmeet.com",
#    password: "foobar",
#    password_confirmation: "foobar"
#)

#mainAdminUser.save!

conf1 = Conference.new(
		Conf_date: "2017/10/15 15:35 pm",
		Street: "Aleja 2",
		City: "Kraków",
		Country: "Polska",
		Prog_lang: "ROR",
		Short_desc: "jakis opis o konferencji"
)

conf1.save!