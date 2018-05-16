class AddSubjectToReviews < ActiveRecord::Migration[5.1]
	 def change
          add_column :reviews, :subject, :string
          add_column :tutorials, :reviewed, :integer
     end
end
