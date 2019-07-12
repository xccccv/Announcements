class AddingImageToAnnouncements < ActiveRecord::Migration[5.2]
  
  def up
    remove_column("announcements", "image_link")
    add_column("announcements", "image", "string")
  end

  def down 
    remove_column("announcements", "image")
    add_column("announcements", "image_link", "uuid")
  end

end
