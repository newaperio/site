ActiveAdmin::Dashboards.build do
  section "Top Authors" do
    ol do
      Author.all.keep_if { |a| a.posts.count > 0 }.sort { |a,b| b.posts.count <=> a.posts.count }.collect do |author|
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
end
