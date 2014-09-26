class Project < ActiveRecord::Base

  has_many :tiers
  accepts_nested_attributes_for :tiers, reject_if: :all_blank, allow_destroy: true
  has_many :pledges, through: :tiers
  has_many :backers, through: :pledges, class_name: "User"
  belongs_to :owner, class_name: "User"

  def current_funding
    self.pledges.all.inject(0) { |sum, pledge| sum + pledge.amount }
  end

  def is_funded
    self.current_funding > self.goal
  end
end
