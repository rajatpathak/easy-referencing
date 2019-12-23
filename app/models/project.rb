class Project < ActiveRecord::Base

	belongs_to :user
	has_many :references

	validate :unique_for_user

	def unique_for_user
		users_projects = Project.where(:user_id => user_id, :name => name)
		if users_projects.count == 0
		else
			reply = "is already an existing project for"
			errors.add(:name, reply)
		end
	end
	
end
