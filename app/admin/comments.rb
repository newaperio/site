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