# frozen_string_literal: true

# create tags migration
class CreateTags < ActiveRecord::Migration[5.2]
  def up
    create_table :tags do |t|
      t.string :tag
      t.integer :announcement_id

      t.timestamps
    end
  end

  def down
    drop_table :tags
  end
end
