class AddForeignKeysToSubcategoriesAndExercises < ActiveRecord::Migration
  def change
    add_column :subcategories, :category_id, :integer
    add_column :exercises, :subcategory_id, :integer
  end
end
