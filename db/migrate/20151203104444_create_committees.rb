class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :committee_name
      t.text :responsibilities
      t.references :contract, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
