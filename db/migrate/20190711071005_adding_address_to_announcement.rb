class AddingAddressToAnnouncement < ActiveRecord::Migration[5.2]
  
  def up
    add_column("announcements", "address", "string")
  end

  def down 
    remove_column("announcements", "address")
  end

end
