class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, null: false
      t.string :content
      t.integer :posting_user_id

      t.timestamps
    end
  end
end
