module ApplicationHelper
  def textilize(text)
    CodeFormatter.new(text).to_html.html_safe unless text.blank?
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def render_post_type(post, single = false)
    post_type = post.post_type.name.downcase    
    unless post_type == "post" || post_type == "chat"
      post_type = "post"
    end
    render :partial => "posts/#{post_type}", :locals => {:post => post, :single => single}
  end
  
  def is_staff(name, email)
    case name
    when "Logan Leger"
      " staff" if email == "logan@newaperio.com"
    when "Evan Cordell"
      " staff" if email == "evan@newaperio.com"
    when "Chris Keele"
      " staff" if email == "chris@newaperio.com"
    end
  end
end
