class Project < ActiveRecord::Base
  has_many :tiers
  accepts_nested_attributes_for :tiers, reject_if: :all_blank, allow_destroy: true
  has_many :donations, through: :tiers
  has_many :backers, through: :donations, class_name: "User"
  belongs_to :creator, class_name: "User"

  validates :goal, :end_date, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
