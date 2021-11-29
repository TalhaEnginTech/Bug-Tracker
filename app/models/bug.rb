class Bug < ApplicationRecord
  validates_uniqueness_of :description
  validates_presence_of :bug_type, :status, :deadline, :description
  has_many :userbugs
  has_many :users, through: :userbugs, dependent: :destroy

  belongs_to :project

  has_one_attached :avatar
end
