class Comment < ActiveRecord::Base
	belongs_to :post
	
	validates :name, :email, :content, :presence => true
end
