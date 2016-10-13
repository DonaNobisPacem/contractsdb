class Committee < ActiveRecord::Base
  belongs_to :contract, inverse_of: :committees

  validates :contract, presence: true
  validates :committee_name, presence: true
  validates :responsibilities, presence: true

  has_many :committee_members, dependent: :destroy, inverse_of: :committee
  accepts_nested_attributes_for :committee_members, allow_destroy: true
end
