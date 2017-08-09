class CreateIngredientRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_recipes do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :metric_id
      t.integer :amount_id

      t.timestamps
    end
  end
end
