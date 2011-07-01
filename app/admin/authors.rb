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