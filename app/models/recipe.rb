class Recipe < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :comments
  has_many :ratings
  has_many :recipe_ingredients
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :recipe_ingredients
  validates :title, :instructions, presence: true

  def self.search(search)
    where("title ILIKE ? OR ingredients ILIKE ? OR instructions ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def total
   ratings_num = self.ratings.inject(0) do |total, rating|
     total += rating.value
   end
   result = ratings_num / self.ratings.count.to_f
   result.round(2)
 end
end
