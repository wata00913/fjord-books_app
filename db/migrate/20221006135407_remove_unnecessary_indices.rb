class RemoveUnnecessaryIndices < ActiveRecord::Migration[6.1]
  def change
    remove_index :follow_relationships, :following_id
    remove_index :follow_relationships, :followed_id
  end
end
