class AddIndicesToUser < ActiveRecord::Migration[5.1]
  def change
  	add_index :users, :username, unique: true
  	add_index :users, :firstname
  	add_index :users, :lastname
  end
end
