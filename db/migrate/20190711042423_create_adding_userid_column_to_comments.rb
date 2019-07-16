# frozen_string_literal: true

# adding user id column to comments
class CreateAddingUseridColumnToComments < ActiveRecord::Migration[5.2]
  def up
    remove_column('comments', 'name')
    add_column('comments', 'user_id', 'integer')
  end

  def down
    remove_column('comments', 'user_id')
    add_column('comments', 'name', 'string')
  end
end
