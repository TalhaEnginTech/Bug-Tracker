class Project < ApplicationRecord
  before_validation do |model|
    # model.assign_developer.reject(&:blank?) if model.assign_developer
  end
  validates_presence_of :title, :project_type
  has_many :usrprojects
  has_many :users, through: :usrprojects
  has_many :bugs, dependent: :destroy
end
