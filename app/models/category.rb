class Category < ActiveRecord::Base
  has_many :posts
  
	def to_param
    "#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
end
