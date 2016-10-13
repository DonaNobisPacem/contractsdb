class CreatePhysicalScopes < ActiveRecord::Migration
  def change
    create_table :physical_scopes do |t|
      t.string :address
      t.decimal :land_area, precision: 15, scale: 2
      t.text :boundaries
      t.text :use_of_premises
      t.references :contract, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
