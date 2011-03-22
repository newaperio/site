class Post < ActiveRecord::Base
	has_one :author
	belongs_to :category
	has_many :comments
	
	def to_param
    "#{id}-#{title.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end 
end
