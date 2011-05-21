ActiveAdmin::Dashboards.build do
  ActiveAdmin.register Post do
    index do
      column :id
      column :title
      column :author, :sortable => :author_id do |post|
        link_to post.author.name, admin_author_path(post.author)
      end
      column :category do |post|
        link_to post.category.name, admin_category_path(post.category.id)
      end
      column :comments do |post|
        post.comments.count.to_s
      end
      column :created_at
      default_actions
    end
    filter :author, :as => :select, :collection => lambda{ Author.all }
    filter :category, :as => :select, :collection => lambda{ Category.all }
    config.comments = false    
  end
  ActiveAdmin.register Comment, :as => "Commenting" do
    index do
      column :id
      column :post, :sortable => :post_id do |comment|
        link_to comment.post.title, admin_post_path(comment.post)
      end
      column :name
      column :email
      column :created_at
      default_actions
    end
    filter :post_id
    filter :name
    filter :email
    filter :url
    filter :created_at
    config.comments = false
  end
  ActiveAdmin.register Author do
    index do
      column :id
      column :name
      column :email
      column :posts do |author|
        author.posts.count.to_s
      end
      default_actions
    end
    filter :name
    filter :email
    config.comments = false
  end
  ActiveAdmin.register Category do
    index do
      column :id
      column :name
      column :posts do |category|
        category.posts.count.to_s
      end
      default_actions
    end
    config.comments = false
    filter :name
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
        li link_to(comment.name, admin_comment_path(comment)) + " on #{comment.post.title}"
      end
    end
  end
end
