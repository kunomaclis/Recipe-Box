class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  validates :name, uniqueness: true, presence: true
end
