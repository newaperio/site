class Category < ActiveRecord::Base
	def to_param
    "#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
end
