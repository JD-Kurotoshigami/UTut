class AddIndexToRequests < ActiveRecord::Migration[5.1]
     def change
          add_index :requests, :tutor_id
          add_index :requests, :tutee_id
          add_index :requests, :tut_id
     end
end
