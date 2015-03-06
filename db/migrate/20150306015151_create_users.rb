class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :password_digest, :role
      t.timestamps
    end
  end
end
