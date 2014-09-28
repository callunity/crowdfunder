class Tier < ActiveRecord::Base

  belongs_to :project
  has_many :pledges
  has_many :backers, through: :pledges, class_name: 'User', foreign_key: 'backer_id'
end
