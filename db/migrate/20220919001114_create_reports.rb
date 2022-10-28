class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :content
      t.integer :posting_user_id

      t.timestamps
    end
  end
end
