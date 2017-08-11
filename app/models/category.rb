class Category < ApplicationRecord
  has_many :recipes
  validates :title, :instructions, presence: true
end
