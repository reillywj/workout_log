class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, :time_zone, :location, :slug
      t.timestamps
    end
    add_column :users, :team_id, :integer
    add_column :categories, :team_id, :integer
  end
end
