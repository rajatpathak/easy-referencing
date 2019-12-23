class CreateProjects < ActiveRecord::Migration

  def up
    create_table :projects do |t|

      t.integer "user_id"
      t.string "name"
      t.timestamps

    end
    add_index("projects", "user_id")
  end

  def down
  	drop_table :projects
  end

end
