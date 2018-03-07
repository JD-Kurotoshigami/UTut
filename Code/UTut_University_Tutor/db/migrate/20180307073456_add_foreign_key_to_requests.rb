class AddForeignKeyToRequests < ActiveRecord::Migration[5.1]
     def change
          add_foreign_key :requests, :users, column: :tutor_id, primary_key: :id, on_delete: :cascade
          add_foreign_key :requests, :users, column: :tutee_id, primary_key: :id, on_delete: :cascade
          add_foreign_key :requests, :tutorials, column: :tut_id, primary_key: :id, on_delete: :cascade
     end
end
