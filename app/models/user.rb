class User < ActiveRecord::Base
	validates_confirmation_of :password
	has_one :profile
	has_many :articles, -> { order('published_at DESC') },
			 :dependent => :nullify
	has_many :replies, :through => :articles, :source => :comments 
end
