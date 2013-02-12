class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.integer :friend_id
      t.string :name
      t.datetime :create_date
      t.datetime :update_date
      t.timestamps
    end
  end
end
