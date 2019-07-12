class RenamingTableAtags < ActiveRecord::Migration[5.2]
  
  def up
    rename_column("atags", "atag", "tag")
    rename_table("atags", "tags")
  end

  def down 
  end
end
