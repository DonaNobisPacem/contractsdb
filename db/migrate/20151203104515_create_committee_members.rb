class CreateCommitteeMembers < ActiveRecord::Migration
  def change
    create_table :committee_members do |t|
      t.string :member_name
      t.boolean :leader
      t.references :committee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
