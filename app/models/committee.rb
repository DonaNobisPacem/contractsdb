class Committee < ActiveRecord::Base
  belongs_to :contract

  validates :contract, presence: true
  validates :committee_name, presence: true
  validates :responsibilities, presence: true

  has_many :committee_members, dependent: :destroy
  accepts_nested_attributes_for :committee_members, allow_destroy: true
end
