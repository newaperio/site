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
  
  form do |f|
    f.inputs do
      f.input :author, :as => :select, :collection => Author.order("name ASC")
      f.input :category, :as => :select, :collection => Category.order("name ASC")
      f.input :post_type, :as => :select, :collection => PostType.order("created_at DESC")
      f.input :title
      f.input :content
    end
    f.buttons
  end
  
  config.comments = false      
end
