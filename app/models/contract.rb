class Contract < ActiveRecord::Base
	validates :contract_type, presence: true
	validates :contract_name, presence: true
	validates :objectives, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :attachment, presence: true

	validate :check_confirmation_approval_date
	validate :check_approval_effective_date
	validate :check_effective_contract_date
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
	mount_uploader :attachment, AttachmentUploader

	def description
		ContractType.find(contract_type).description
	end

	private

		def check_confirmation_approval_date
			if confirmation_date.present? && approval_date.present?
				if confirmation_date > approval_date
					errors[:confirmation_date] << "The BOR Confirmation Date cannot be later than the BOR Approval Date!"
					errors[:approval_date] << "The BOR Approval Date cannot be earlier than the BOR Confirmation Date!"
				end
			end
		end

		def check_approval_effective_date
			if approval_date.present? && start_date.present?
				if approval_date > start_date
					errors[:approval_date] << "The BOR Approval Date cannot be later than the Effectivity Start Date!"
					errors[:start_date] << "The Effectivity Start Date cannot be earlier than the BOR Approval Date!"
				end
			end
		end

		def check_effective_contract_date
			if start_date.present? && end_date.present?
				if start_date > end_date
					errors[:start_date] << "The Effectivity Start Date cannot be later than the Effectivity End Date!"
					errors[:end_date] << "The Effectivity End Date cannot be earlier than the Effectivity Start Date!"
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
