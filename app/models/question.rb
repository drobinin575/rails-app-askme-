class Question < ApplicationRecord
  validate :custom_message

  def custom_message
    if body.blank?
      errors.add(:_, "The question text cannot be blank.")
    end

    if body.length < 10
      errors.add(:_, "The question text should contain minimum 10 symbols.")
      end

    if body.length > 280
      errors.add(:_, "The question text should contain maximum 280 symbols.")
    end
  end
end
