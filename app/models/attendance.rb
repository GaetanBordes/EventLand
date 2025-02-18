class Attendance < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :event

  # Validations
  validates :stripe_customer_id, presence: true
end
