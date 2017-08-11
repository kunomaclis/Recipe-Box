class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :value, numericality: true
end
