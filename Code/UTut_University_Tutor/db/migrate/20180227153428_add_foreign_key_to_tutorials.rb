class AddForeignKeyToTutorials < ActiveRecord::Migration[5.1]
     def change
          add_foreign_key :tutorials, :users, column: :tutor_id, primary_key: :id, on_delete: :cascade
     end
end
