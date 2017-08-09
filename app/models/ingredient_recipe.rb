class IngredientRecipe < ApplicationRecord
  belongs_to :ingredient
  belongs_to :metric
  belongs_to :amount
  belongs_to :recipe
end
