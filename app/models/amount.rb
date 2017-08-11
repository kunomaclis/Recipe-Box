class Amount < ApplicationRecord
  has_many :recipe_ingredients
  validates :number, uniqueness: true, presence: true
end
