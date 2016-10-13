class AddContractNameToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :contract_name, :string
    add_column :contracts, :confirmation_date, :datetime
    add_column :contracts, :approval_date, :datetime
  end
end
