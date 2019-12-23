class CreateResetPasswordCodes < ActiveRecord::Migration
  
  def up
    create_table :reset_password_codes do |t|

      t.integer "user_id"
      t.string "code"
      t.timestamps

    end
    add_index("reset_password_codes", "user_id")
  end

  def down
  	drop_table :reset_password_codes
  end

end

