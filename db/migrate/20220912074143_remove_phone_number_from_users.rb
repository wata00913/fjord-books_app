class RemovePhoneNumberFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :phone_number, :string
  end
end
