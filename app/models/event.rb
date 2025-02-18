class Event < ApplicationRecord
  # Relations
  belongs_to :admin, class_name: 'User'
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  # Validations
  validates :start_date, presence: { message: "La date de début doit être renseignée" }
  validate :start_date_cannot_be_in_the_past

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :duration_multiple_of_five

  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  # Méthode pour obtenir la date de fin (start_date + duration)
  def end_date
    start_date + duration.minutes if start_date.present? && duration.present?
  end

  private

  # Validation : La date de début ne peut pas être dans le passé
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Time.now
      errors.add(:start_date, "can't be in the past")
    end
  end

  # Validation : La durée doit être un multiple de 5
  def duration_multiple_of_five
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "must be a multiple of 5")
    end
  end
end
