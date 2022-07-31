class Question < ApplicationRecord
  validates :body, presence: true, length: { in: 10..280 }
end
