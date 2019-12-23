class ChangeDataColumnInReferencesInText < ActiveRecord::Migration

  def up
  	remove_column "references", "data"
  	add_column "references", "data", :text
  end

  def down
  	remove_column "references", "data"
  	add_column "references", "data", :string
  end

end
