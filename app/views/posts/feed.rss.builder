xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "NewAperio"
    xml.description "This cleverly titled blog is authored by NewAperio, a web and mobile development collective in Baton Rouge. We write about programming, design and entrepreneurship."
    xml.link post_index_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description textilize(post.content)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
