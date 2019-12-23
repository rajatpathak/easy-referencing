class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|

      t.string "name"
      t.string "password"
      t.boolean "email_verified"
      t.string "email"
      t.datetime "last_sync"	
      t.timestamps

    end
    add_index("users", "name")
  end

  def down
  	drop_table :users
  end

end
