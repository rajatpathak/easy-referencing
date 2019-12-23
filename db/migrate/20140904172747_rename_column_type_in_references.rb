class RenameColumnTypeInReferences < ActiveRecord::Migration

  def up
  	rename_column("references", "type", "reference_type")
  end

  def down
  	rename_column("references", "reference_type", "type")
  end

end
