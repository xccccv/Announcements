# frozen_string_literal: true

# add announcements id to comments migration
class AddAnnouncementIdToComments < ActiveRecord::Migration[5.2]
  def up
    add_column :comments, :announcement_id, :integer
  end

  def down
    drop_column :comments, :announcement_id
  end
end
