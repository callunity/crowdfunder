class Pledge < ActiveRecord::Base

  belongs_to :backer, class_name: "User"
  belongs_to :tier
  delegate :project, to: :tier
end
