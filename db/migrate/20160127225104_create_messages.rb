class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :creator, class: 'User'
      t.string :content
      t.timestamps
    end
  end
end
