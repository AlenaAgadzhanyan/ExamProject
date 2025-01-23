class Session < ApplicationRecord
  belongs_to :perfomance

  validates :perfomance, presence: true
  validates :hall_number, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true

  validate :validate_hall_number
  validate :validate_start_date_in_future

  private

  def validate_hall_number
    if hall_number.present? && hall_number <= 0
      errors.add(:hall_number, "должен быть больше 0")
    end
  end

  def validate_start_date_in_future
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "не может быть в прошлом")
    end
  end
end
