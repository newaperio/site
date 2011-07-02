class MakeAllExistingPostsOfTypePost < ActiveRecord::Migration
  def self.up
    Post.all.each do |post|
      post.post_type_id = 1
      post.save
    end
  end

  def self.down
  end
end
