class CommitteeMember < ActiveRecord::Base
  belongs_to :committee, inverse_of: :committee_members

  validates :committee, presence: true
  validates :member_name, presence: true
  validates :leader, inclusion: [true, false]
end
