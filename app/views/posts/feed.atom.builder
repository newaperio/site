atom_feed :language => 'en-US', :root_url => post_index_url do |feed|
  feed.title "NewAperio"
  feed.subtitle "This cleverly titled blog is authored by NewAperio, a web and mobile development collective in Baton Rouge. We write about programming, design and entrepreneurship."
  feed.updated @posts.first.created_at

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title post.title
      entry.content textilize(post.content), :type => 'html'
      entry.author do |author|
        author.name post.author.name
      end
    end
  end
end
