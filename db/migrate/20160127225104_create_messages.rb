class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, index: true, unique: true, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
