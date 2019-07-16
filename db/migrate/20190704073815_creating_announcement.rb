# frozen_string_literal: true

# creating announcement migration
class CreatingAnnouncement < ActiveRecord::Migration[5.2]
  def up
    create_table :announcements do |t|
      t.string 'title'
      t.string 'description'
      t.uuid 'image_link'
      t.string 'tag'
      t.boolean 'activity', default: false
      t.integer 'user_id'
      t.text 'text'

      t.timestamps
    end
  end

  def down
    drop_table :announcements
  end
end
