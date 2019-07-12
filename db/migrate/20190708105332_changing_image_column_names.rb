class ChangingImageColumnNames < ActiveRecord::Migration[5.2]
  
  def up
    rename_column("users", "image", "avatar")
    rename_column("announcements", "image", "avatar")
  end

  def down
    rename_column("announcements", "avatar", "image")
    rename_column("users", "avatar", "image")
  end

end
