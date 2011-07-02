class AddPostTypeToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :post_type_id, :integer, :default => 1
  end

  def self.down
    remove_column :posts, :post_type_id
  end
end
