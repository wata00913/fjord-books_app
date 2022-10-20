class CreateFollowRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_relationships do |t|
      t.integer :following_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :follow_relationships, :following_id
    add_index :follow_relationships, :followed_id
    add_index :follow_relationships, [:following_id, :followed_id], unique: true
  end
end
