class Review < ApplicationRecord
  belongs_to :user
  validates :body, :rating, :presence => true
end
