class Project < ActiveRecord::Base

  validates :start_date, :end_date, :goal, presence: true
  validates :goal, numericality: { only_integer: true }
  validates :name, presence: true, uniqueness: { case_sensitive: false }


  has_many :tiers
  accepts_nested_attributes_for :tiers, reject_if: :all_blank, allow_destroy: true
  has_many :pledges, through: :tiers
  has_many :backers, through: :pledges, class_name: "User"
  belongs_to :owner, class_name: "User"
  has_many :comments, as: :commentable

  acts_as_taggable_on :comments

  def current_funding
    self.pledges.sum(:amount)
  end

  def is_funded?
    self.current_funding >= self.goal
  end

  def is_current?
    self.end_date > Time.now
  end

  def is_expired?
    self.end_date <= Time.now
  end

end
