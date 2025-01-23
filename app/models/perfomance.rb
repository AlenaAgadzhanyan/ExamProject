class Perfomance < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :duration, presence: true
  validates :age_rating, presence: true
  validates :release_date, presence: true

  validate :validate_duration_format
  validate :validate_age_rating_format

  private

  def validate_duration_format
    if duration.present? && duration <= 0
      errors.add(:duration, "должно быть больше 0")
    end
  end

  def validate_age_rating_format
    if age_rating.present? && age_rating !~ /\A\d{1,2}\+\z/
      errors.add(:age_rating, "должно быть в формате '12+''")
    end
  end
end
