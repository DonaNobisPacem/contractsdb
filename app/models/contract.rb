class Contract < ActiveRecord::Base
	validates :contract_type, presence: true
	validates :objectives, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true

	validate :check_contract_date
	validate :check_contract_type

	has_one :financial_term, dependent: :destroy, inverse_of: :contract
	has_one :physical_scope, dependent: :destroy, inverse_of: :contract
	has_many :parties, dependent: :destroy, inverse_of: :contract
	has_many :committees, dependent: :destroy, inverse_of: :contract

	accepts_nested_attributes_for :financial_term, allow_destroy: true
	accepts_nested_attributes_for :physical_scope, allow_destroy: true
	accepts_nested_attributes_for :parties, allow_destroy: true
	accepts_nested_attributes_for :committees, allow_destroy: true	

	searchkick

	private
		def check_contract_date
			if start_date.present? && end_date.present?
				if start_date > end_date
					errors[:start_date] << "The start date cannot be greater than the end date!"
					errors[:end_date] << "The start date cannot be greater than the end date!"
				end
			end
		end

		def check_contract_type
			if contract_type.present?
				if ContractType.where(id: contract_type).empty?
					errors[:contract_type] << "Must have a valid contract type!"
				end
			end
		end
end
