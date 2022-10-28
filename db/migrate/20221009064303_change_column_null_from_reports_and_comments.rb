class ChangeColumnNullFromReportsAndComments < ActiveRecord::Migration[6.1]
  def change
    change_table :reports do |t|
      t.change_null :title, false
    end
    change_table :comments do |t|
      t.change_null :content, false
    end
  end
end
