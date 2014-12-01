class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :liked

      t.timestamps
    end
  end
end
