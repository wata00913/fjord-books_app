class RenamePostingUserIdToUserId < ActiveRecord::Migration[6.1]
  def change
    change_table :reports do |t|
      t.remove :posting_user_id
      t.references :user, null: false
    end

    change_table :comments do |t|
      t.remove :posting_user_id
      t.references :user, null: false
    end
  end
end
