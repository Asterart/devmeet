class AddDetailsToConference < ActiveRecord::Migration[5.1]
  def change
    add_column :conferences, :Conf_date, :datetime
    add_column :conferences, :Street, :string
    add_column :conferences, :City, :string
    add_column :conferences, :Country, :string
    add_column :conferences, :Prog_lang, :string
    add_column :conferences, :Date_of_accept, :datetime
    add_column :conferences, :Date_of_reject, :datetime
    add_column :conferences, :Short_desc, :text
  end
end
