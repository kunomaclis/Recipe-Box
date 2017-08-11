class Recipe < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :comments
  has_many :ratings
  has_many :recipe_ingredients
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :recipe_ingredients

  def self.search(search)
  where("title ILIKE ? OR ingredients ILIKE ? OR instructions ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
