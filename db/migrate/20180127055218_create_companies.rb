class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :bs
      t.string :logo
      t.string :org_type

      t.timestamps
    end
  end
end
