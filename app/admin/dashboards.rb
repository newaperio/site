ActiveAdmin::Dashboards.build do
  section "Top Authors" do
    ol do
      Author.includes(:posts).order("count(posts.id) DESC").collect do |author|
        li link_to(author.name, admin_author_path(author)) + " (#{author.posts.count})"
      end
    end
  end
  
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
        li link_to(comment.post.title, admin_commenting_path(comment)) + " by #{comment.name}"
      end
    end
  end
end
