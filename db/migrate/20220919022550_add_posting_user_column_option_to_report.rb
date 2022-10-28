class AddPostingUserColumnOptionToReport < ActiveRecord::Migration[6.1]
  def change
    change_table :reports do |t|
      t.foreign_key :users, column: :posting_user_id
    end
  end
end
