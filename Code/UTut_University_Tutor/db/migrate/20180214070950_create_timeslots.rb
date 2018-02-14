class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.integer :start_hr
      t.integer :start_min
      t.integer :end_hr
      t.integer :end_min

      t.timestamps
    end
  end
end
