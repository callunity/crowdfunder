class Tier < ActiveRecord::Base

  belongs_to :project
  has_many :pledges
  has_many :backers, through: :pledges, source: :user, foreign_key: 'backer_id'
end
