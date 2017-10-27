# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#mainAdminUser = Admin.new(
#    email: "me2@devmeet.com",
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
		Date_of_accept: "2017/10/17 15:35 pm",
		Short_desc: "jakis opis o konferencji"
)

conf2 = Conference.new(
		Conf_date: "2017/10/12 15:25 pm",
		Street: "Aleja 2",
		City: "Kraków",
		Country: "Polska",
		Prog_lang: "Java",
		Short_desc: "jakis opis o konferencji"
)

conf1.save!
conf2.save!