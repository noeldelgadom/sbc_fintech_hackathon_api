class AddCompanyUserIndexOnCartItems < ActiveRecord::Migration[5.1]
  def change
    add_index :cart_items, [:user_id, :company_id, :item_id], unique: true
  end
end
