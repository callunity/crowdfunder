class User < ActiveRecord::Base
  has_secure_password
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :owned_projects, class_name: "Project"
  has_many :pledges
  has_many :backed_projects, through: :pledges, class_name: "Project"

end
