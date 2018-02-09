class CreateUsers < ActiveRecord::Migration[5.1]
     # Change
     # Jan 30, 2018
     # Creates the users table
     def change
          create_table :users do |t|
               t.string :username
               t.string :firstname
               t.string :lastname
               t.string :sex
               t.string :description
          end
     end
end
