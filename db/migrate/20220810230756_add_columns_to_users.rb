class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :post_code, :string
    add_column :users, :phone_number, :string
    add_column :users, :self_introduction, :string
  end
end
