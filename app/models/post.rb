class Post < ActiveRecord::Base
	belongs_to :author
	belongs_to :category
	belongs_to :post_type
	has_many :comments, :dependent => :destroy

	validates :title, :content, :author_id, :category_id, :post_type_id, :presence => true
	
	after_create :campfire
	
	def to_param
    "#{id}-#{title.downcase.gsub(/[[:punct:]]/,'').gsub(/[^[:alnum:]]/,'-')}".strip.gsub(/-{2,}/,'-')
  end 

  def self.front_end_search(query)
    where(front_end_search_conditions(query))
  end
  
  private
  
  def campfire
    begin
      campfire = Tinder::Campfire.new('newaperio',:token => '4ff664abcb2ea9663ded0fc8674b0ac6a715b46d')
      room = campfire.find_room_by_name("the Lyceum")
      room.speak("#{self.author.name} just posted \"#{self.title}\". Read it now: http://newaperio.com/blog/#{self.to_param}.")
	  rescue => e
	   Rails.logger.debug { "Error posting notification to campfire." }
	  end
  end
  
  def self.front_end_search_conditions(query)
    query.split(/\s+/).map do |word|
      '(' + %w[title content].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(' AND ')
  end
end
