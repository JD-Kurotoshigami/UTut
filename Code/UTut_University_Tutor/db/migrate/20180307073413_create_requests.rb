class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :tut_id
      t.integer :tutor_id
      t.integer :tutee_id

      t.timestamps
    end
  end
end
