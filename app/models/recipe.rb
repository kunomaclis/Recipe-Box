class Recipe < ApplicationRecord
  has_many :comments
  has_many :ratings
  has_many :recipe_ingredients
  belongs_to :category
  belongs_to :user
end
