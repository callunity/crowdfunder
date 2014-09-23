class Tier < ActiveRecord::Base

  belongs_to :project
  has_many :pledges
  has_many :backers, through: :donations, class_name: "User"
end
