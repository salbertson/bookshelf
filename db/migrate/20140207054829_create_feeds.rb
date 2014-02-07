class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.timestamps
      t.integer :user_id, null: false
      t.string :url, null: false
      t.string :name, null: false
    end
  end
end
