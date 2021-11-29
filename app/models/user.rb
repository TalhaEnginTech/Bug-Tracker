class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :name, :email, :role
  validates_confirmation_of :encrypted_password
  has_many :usrprojects
  has_many :projects, through: :usrprojects

  has_many :userbugs, dependent: :destroy
  has_many :bugs, through: :userbugs
end
