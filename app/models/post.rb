class Post < ActiveRecord::Base
	belongs_to :author
	belongs_to :category
	has_many :comments, :dependent => :destroy

	validates :title, :content, :author_id, :category_id, :presence => true
	
	def to_param
    "#{id}-#{title.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end 

  def self.front_end_search(query)
    where(front_end_search_conditions(query))
  end
  
  private
  
  def self.front_end_search_conditions(query)
    query.split(/\s+/).map do |word|
      '(' + %w[title content].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(' AND ')
  end
end
