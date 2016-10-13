class FinancialTerm < ActiveRecord::Base
  belongs_to :contract, inverse_of: :financial_term

  validates :contract, presence: true
  validates_presence_of :payer, if: :is_under_lease?
  validates_presence_of :payee, if: :is_under_lease?
  validates_presence_of :amount, if: :is_under_lease?
  validates_presence_of :frequency, if: :is_under_lease?
  validates_presence_of :start_date, if: :is_under_lease?
  validates_presence_of :end_date, if: :is_under_lease?
  validates_presence_of :escalation_rate, if: :is_under_lease?
  validates_presence_of :advance, if: :is_under_lease?
  validates_presence_of :deposit, if: :is_under_lease?

  validates :amount, numericality: { :greater_than_or_equal_to => 0, allow_nil: true }
  validates :escalation_rate, numericality: { :greater_than_or_equal_to => 0, allow_nil: true }
  validates :advance, numericality: { :greater_than_or_equal_to => 0, allow_nil: true }
  validates :deposit, numericality: { :greater_than_or_equal_to => 0, allow_nil: true }

  validate :check_date

  private
	def check_date
		if start_date.present? && end_date.present?
			if start_date > end_date
				errors[:start_date] << "The start date cannot be greater than the end date!"
				errors[:end_date] << "The start date cannot be greater than the end date!"
			end
		end
	end

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
