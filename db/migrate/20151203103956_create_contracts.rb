class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :contract_type
      t.text :objectives
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
