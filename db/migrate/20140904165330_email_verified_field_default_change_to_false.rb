class EmailVerifiedFieldDefaultChangeToFalse < ActiveRecord::Migration

  def up
  	remove_column "users", "email_verified"
  	add_column "users", "email_verified", :boolean, :default => false
  end

  def down
  	remove_column "users", "email_verified"
  	add_column "users", "email_verified", :boolean
  end

end
