class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
      t.string :username, null: false
      t.string :email, null: false
    end

    add_index :users, :username, unique: true
  end
end
