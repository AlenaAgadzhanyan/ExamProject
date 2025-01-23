class Review < ApplicationRecord
  belongs_to :perfomance

  validates :user_name, presence: true
  validates :rating, presence: true
  validates :review_text, presence: true
  validates :review_date, presence: true

  validate :validate_rating_range
  validate :validate_review_date_format

  private

  def validate_rating_range
    if rating.present? && !(1..10).include?(rating)
      errors.add(:rating, "должен быть в диапазоне от 1 до 10")
    end
  end

  def validate_review_date_format
    if review_date.present? && review_date > Date.today
      errors.add(:review_date, "не может быть в будущем")
    end
  end

end
