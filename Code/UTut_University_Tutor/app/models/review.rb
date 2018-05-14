class Review < ApplicationRecord
  belongs_to :user
  validates :body, :rating, :subject, :presence => true
end
