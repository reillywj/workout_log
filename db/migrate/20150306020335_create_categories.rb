class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :abbreviation
      t.timestamps
    end

    create_table :subcategories do |t|
      t.string :name
      t.integer :rank
      t.timestamps
    end

    create_table :exercises do |t|
      t.string :name, :nickname
      t.timestamps
    end
  end
end
