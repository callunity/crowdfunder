class Project < ActiveRecord::Base

  has_many :tiers
  has_many :donations, through: :tiers
  has_many :backers, through: :donations, class_name: "User"
  belongs_to :creator, class_name: "User"
end
