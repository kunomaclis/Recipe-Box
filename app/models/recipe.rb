class Recipe < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :comments
  has_many :ratings
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :recipe_ingredients

  def self.search(search)
    #joins is used to bring the ingredients table into the search query
    joins(:ingredients).where("title ILIKE ? OR instructions ILIKE ? OR ingredients.name ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
