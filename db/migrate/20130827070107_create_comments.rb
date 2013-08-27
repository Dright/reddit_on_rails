class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.belongs_to :user
      t.belongs_to :link

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :link_id
  end
end
