class AddAttachmentToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :attachment, :string
  end
end
