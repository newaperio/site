class Author < ActiveRecord::Base
	has_many :posts
	
	attr_accessible :email, :password, :password_confirmation, :name
	attr_accessor :password 
	
	before_save :encrypt_password
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_format_of :email, :with => /(\S)+@newaperio.com/
	
	def self.authenticate(email, password)
	  author = find_by_email(email)
	  if author && BCrypt::Password.new(author.password_hash) == password
	    author
	  else
	    nil
	  end
	end

	def encrypt_password
	  if password.present?
	    self.password_hash = BCrypt::Password.create(password)
	  end
	end	
end