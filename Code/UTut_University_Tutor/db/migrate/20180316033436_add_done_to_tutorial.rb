class AddDoneToTutorial < ActiveRecord::Migration[5.1]
     def change
          add_column :tutorials, :done, :integer
     end
end
