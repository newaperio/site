ActiveAdmin::Dashboards.build do
  section "Recent Posts" do
    ul do
      Post.limit(15).order("created_at DESC").collect do |post|
        li link_to(post.title, admin_post_path(post))
      end
    end
  end
  
  section "Recent Comments" do
    ul do
      Comment.limit(15).order("created_at DESC").collect do |comment|
        li link_to(comment.name, admin_comment_path(comment)) + " on #{comment.post.title}"
      end
    end
  end
end
