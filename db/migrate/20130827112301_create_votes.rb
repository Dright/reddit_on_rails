class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :link
      t.boolean :up

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :link_id
  end
end
