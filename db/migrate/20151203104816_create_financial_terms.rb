class CreateFinancialTerms < ActiveRecord::Migration
  def change
    create_table :financial_terms do |t|
      t.string :payer
      t.string :payee
      t.decimal :amount, precision: 15, scale: 2
      t.string :frequency
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :escalation_rate, precision: 15, scale: 2
      t.decimal :advance, precision: 15, scale: 2
      t.decimal :deposit, precision: 15, scale: 2
      t.references :contract, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
