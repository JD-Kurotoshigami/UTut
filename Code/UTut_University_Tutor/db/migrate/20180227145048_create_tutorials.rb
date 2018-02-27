class CreateTutorials < ActiveRecord::Migration[5.1]
  def change
    create_table :tutorials do |t|
      t.integer :tutor_id
      t.integer :tutee_id
      t.string :subject
      t.string :day
      t.integer :start_hr
      t.integer :start_min
      t.integer :end_hr
      t.integer :end_min

      t.timestamps
    end
  end
end
