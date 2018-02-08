class AddIndicesToUser < ActiveRecord::Migration[5.1]
     # Change
     # Jan 30, 2018
     # adds index to the users table on username, firstname, and lastname
     def change
          add_index :users, :username, unique: true
          add_index :users, :firstname
          add_index :users, :lastname
     end
end
