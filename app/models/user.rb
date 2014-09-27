class User < ActiveRecord::Base
  has_secure_password
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :owned_projects, class_name: "Project", foreign_key: 'owner_id'
  has_many :pledges, foreign_key: 'backer_id'
  has_many :backed_projects, through: :pledges, source: :project

  def total_pledges
    self.pledges.sum(:amount)
  end

  # these projects' end date has passed AND they were funded
  def successful_backed_projects
    self.backed_projects.select { |project| project.is_expired? && project.is_funded? }
  end

  # these projects' end date is in the future
  def unexpired_projects
    self.backed_projects.select { |project| project.is_current? }
  end

  # these pledges refer to projects whose end date has passed AND project was funded
  def collected_pledges
    pledges = self.pledges.select { |pledge| pledge.project.is_expired? && pledge.project.is_funded? }
    pledges.sum(:amount)
  end

  # these pledges refer to projects whose fate is still unknown
  def uncommitted_pledges
    pledges = self.pledges.select { |pledge| pledge.project.is_current? }
    pledges.sum(:amount)
  end

end
