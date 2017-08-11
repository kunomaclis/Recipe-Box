class Recipe < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :comments
  has_many :ratings
  has_many :recipe_ingredients
  belongs_to :category
  belongs_to :user
  # has_many :amounts
  # has_many :amounts, through: :recipe_ingredients
  # has_many :metrics
  # has_many :metrics, through: :recipe_ingredients
  # has_many :ingredients
  # has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients


  def self.search(search)
    Recipe.where(self.arel_table[:title].matches('%#{search}%'))
  end

end
