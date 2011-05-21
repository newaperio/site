module ApplicationHelper
  def textilize(text)
    Textilizer.new(text).to_html.html_safe unless text.blank?
  end
  
  def title(page_title)
    content_for(:title) { page_title }
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
