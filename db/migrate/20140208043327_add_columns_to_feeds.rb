class AddColumnsToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :etag, :string
    add_column :feeds, :last_modified_at, :datetime
  end
end
