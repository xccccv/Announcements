class CreateComments < ActiveRecord::Migration[5.2]
  
  def up
    create_table :comments do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
