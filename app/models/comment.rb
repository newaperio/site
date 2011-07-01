class Comment < ActiveRecord::Base
	belongs_to :post
	
	validates :name, :email, :content, :presence => true
	
	before_save :http
	
	private
	
	def http
	  if self.url.present?
	    self.url = "http://" + self.url unless self.url =~ /http[s]?:\/\//
	  end
	end
end
