class AddCompletionColumnToSets < ActiveRecord::Migration
  def change
    add_column :workout_sets, :completion, :boolean
  end
end
