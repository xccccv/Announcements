
# removing tag column from announcemetns migration
class CreateRemovingTagColumnFromAnnouncements < ActiveRecord::Migration[5.2]
  def up
    remove_column('announcements', 'tag')
  end

  def down
    add_column('announcements', 'tag', 'string')
  end
end
