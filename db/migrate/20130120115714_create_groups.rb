class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :name
      t.timestamps
    end
  end
end
