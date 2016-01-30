class CreateLikeDislikes < ActiveRecord::Migration
  def change
    create_table :like_dislikes do |t|
      t.belongs_to :user
      t.belongs_to :message
      t.boolean :likes
      t.timestamps null: false
    end
  end
end
