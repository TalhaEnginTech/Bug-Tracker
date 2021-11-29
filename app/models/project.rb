class Project < ApplicationRecord
  validates_presence_of :title, :project_type
  has_many :usrprojects
  has_many :users, through: :usrprojects
  has_many :bugs, dependent: :destroy
end
