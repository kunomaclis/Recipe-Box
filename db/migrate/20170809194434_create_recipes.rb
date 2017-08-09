class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :summary
      t.string :difficulty
      t.string :prep_time
      t.string :instructions
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
