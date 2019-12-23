class User < ActiveRecord::Base

	has_secure_password

	has_many :reset_password_codes
	has_many :projects
	has_many :references, :through => :projects

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-0.-]+\.[a-z]{2,4}\Z/i


	validates :name, :presence => true,
  					 :length => { :maximum => 50}
  	validates :email, :presence => true,
  					:length => { :maximum => 100},
  					:format => EMAIL_REGEX,
  					:uniqueness => true
	
end
