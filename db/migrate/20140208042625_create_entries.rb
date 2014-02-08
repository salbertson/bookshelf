class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :feed_id
      t.string :guid
      t.string :url
      t.string :title
      t.text :content
      t.datetime :published_at
    end
  end
end
