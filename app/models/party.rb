class Party < ActiveRecord::Base
  belongs_to :contract

  validates :contract, presence: true
  validates :party_name, presence: true
  validates :external, inclusion: [true, false]

end
