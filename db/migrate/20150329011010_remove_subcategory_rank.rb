class RemoveSubcategoryRank < ActiveRecord::Migration
  def change
    remove_column :subcategories, :rank
  end
end
