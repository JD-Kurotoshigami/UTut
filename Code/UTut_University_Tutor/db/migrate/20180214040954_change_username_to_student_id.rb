class ChangeUsernameToStudentId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :username, :studentid
  end
end
