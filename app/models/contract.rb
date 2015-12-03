class Contract < ActiveRecord::Base
	validates :contract_type, presence: true
	validates :objectives, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true

	validate :check_contract_date

	has_many :parties
	has_many :committees

	private
		def check_contract_date
			if start_date.present? && end_date.present?
				if start_date > end_date
					errors[:start_date] << "The start date cannot be greater than the end date!"
					errors[:end_date] << "The start date cannot be greater than the end date!"
				end
			end
		end
end
