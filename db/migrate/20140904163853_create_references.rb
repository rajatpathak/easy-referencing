class CreateReferences < ActiveRecord::Migration

  def up
    create_table :references do |t|

      t.string "type"
      t.string "data"
      t.integer "project_id"
      t.timestamps

    end
    add_index("references", "type")
    add_index("references", "project_id")
  end


  def down
  	drop_table :references
  end

end
