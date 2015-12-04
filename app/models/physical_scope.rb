class PhysicalScope < ActiveRecord::Base
  belongs_to :contract

  validates :contract, presence: true
  validates_presence_of :address, if: :is_under_lease?
  validates_presence_of :land_area, if: :is_under_lease?
  validates_presence_of :boundaries, if: :is_under_lease?
  validates_presence_of :use_of_premises, if: :is_under_lease?

  validates :land_area, numericality: { :greater_than_or_equal_to => 0 }

  private

	def is_under_lease?
		if contract.present?
			if contract.contract_type == 3
				return true
			else
				return false
			end
		end
	end
end
