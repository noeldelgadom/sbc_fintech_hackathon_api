class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
