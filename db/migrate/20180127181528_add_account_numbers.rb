class AddAccountNumbers < ActiveRecord::Migration[5.1]
  def change
    add_column :users,      :account_number, :integer
    add_column :companies,  :account_number, :integer
  end
end
