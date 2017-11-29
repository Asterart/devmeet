class ConvertDatabaseToUtf8mb4 < ActiveRecord::Migration
  def change
    # for each table that will store unicode execute:
    execute "ALTER TABLE conferences CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    # for each string/text column with unicode content execute:
    execute "ALTER TABLE conferences CHANGE Short_desc VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
  end
end