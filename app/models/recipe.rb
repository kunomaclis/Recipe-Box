class Recipe < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :ratings
  has_many :recipe_ingredients
end
