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