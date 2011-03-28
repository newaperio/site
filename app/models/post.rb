class Post < ActiveRecord::Base
	has_one :author
	belongs_to :category
	has_many :comments
	
	validates_presence_of :title
	validates_presence_of :author_id
	validates_presence_of :category_id
	validates_presence_of :content
	
	def to_param
    "#{id}-#{title.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end 
end
