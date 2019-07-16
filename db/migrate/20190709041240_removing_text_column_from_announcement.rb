
# removing text column from announcement migration
class RemovingTextColumnFromAnnouncement < ActiveRecord::Migration[5.2]
  def up
    remove_column('announcements', 'text')
  end

  def down
    add_column('announcements', 'text')
  end
end
