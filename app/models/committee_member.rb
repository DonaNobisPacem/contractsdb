class CommitteeMember < ActiveRecord::Base
  belongs_to :committee

  validates :committee, presence: true
  validates :member_name, presence: true
  validates :leader, inclusion: [true, false]
end
