class User < ActiveRecord::Base
  has_secure_password

  has_many :owned_projects, class_name: "Project"
  has_many :donations
  has_many :backed_projects, through: :donations, class_name: "Project"

end
