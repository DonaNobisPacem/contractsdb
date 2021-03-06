class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :party_name
      t.boolean :external
      t.references :contract, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
