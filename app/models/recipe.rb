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
  validates :title, :instructions, presence: true

  #joins is used to bring the ingredients table into the search query
  def self.search(search)
      joins(:ingredients).where("title ILIKE ? OR instructions ILIKE ? OR ingredients.name ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%").uniq
  end

  def total
   ratings_num = self.ratings.inject(0) do |total, rating|
     total += rating.value
   end
   result = ratings_num / self.ratings.count.to_f
   return 'No Ratings!' if result.nan?
   result.round(2)
  end




end
