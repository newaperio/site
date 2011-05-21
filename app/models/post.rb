class Post < ActiveRecord::Base
	belongs_to :author
	belongs_to :category
	has_many :comments, :dependent => :destroy
	
	validates_presence_of :title
	validates_presence_of :author_id
	validates_presence_of :category_id
	validates_presence_of :content
	
	def to_param
    "#{id}-#{title.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end 

  # def self.search(query)
  #   where(search_conditions(query))
  # end
  # 
  # private
  # 
  # def self.search_conditions(query)
  #   query.split(/\s+/).map do |word|
  #     '(' + %w[title content].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
  #   end.join(' AND ')
  # end
end
