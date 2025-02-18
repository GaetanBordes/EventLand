class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  
  has_many :admin_events, class_name: 'Event', foreign_key: 'admin_id', dependent: :destroy

  
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
end
