class Comment < ActiveRecord::Base
	belongs_to :post
	
	validates :name, :email, :content, :presence => true
	
	before_save :http
	
	private
	
	def http
   unless self.url =~ /http[s]?:\/\//
     self.url = "http://" + self.url
   end
	end
end
