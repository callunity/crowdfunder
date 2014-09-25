class User < ActiveRecord::Base
  has_secure_password
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :owned_projects, class_name: "Project", foreign_key: 'owner_id'
  has_many :pledges, foreign_key: 'backer_id'
  has_many :backed_projects, through: :pledges, source: :project

end
