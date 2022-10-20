class AddFollowedColumnIndex < ActiveRecord::Migration[6.1]
  def change
    add_index(:follow_relationships, :followed_id)
  end
end
