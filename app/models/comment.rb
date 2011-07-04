class Comment < ActiveRecord::Base
	belongs_to :post
	
	validates :name, :email, :content, :presence => true
	
	before_save :http
	
	after_create :campfire, :if => Proc.new { |p| Rails.env.production? }
	
	private
	
	def campfire
	  begin
      campfire = Tinder::Campfire.new('newaperio',:token => '4ff664abcb2ea9663ded0fc8674b0ac6a715b46d')
      room = campfire.find_room_by_name("the Lyceum")
      room.speak("#{self.name} just posted a comment on \"#{self.post.title}\". Read it now: http://newaperio.com/blog/#{self.post.to_param}#comments.")
	  rescue => e
	   Rails.logger.debug { "Error posting notification to campfire." }
	  end
  end
	
	def http
	  if self.url.present?
	    self.url = "http://" + self.url unless self.url =~ /http[s]?:\/\//
	  end
	end
end
