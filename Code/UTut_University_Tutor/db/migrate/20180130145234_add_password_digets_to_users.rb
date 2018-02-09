class AddPasswordDigetsToUsers < ActiveRecord::Migration[5.1]
     # Change
     # Jan 30, 2018
     # Adds password_digest attribute to users table
     def change
          add_column :users, :password_digest, :string
     end
end
