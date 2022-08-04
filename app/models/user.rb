class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_nickname

  validates :email, :nickname, presence: true, uniqueness: true
  validates :email, format: {
    with: /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/
  }
  validates :nickname, length: { in: 2..40 }, format: { with: /\A\w+\z/ }

  has_many :questions, dependent: :delete_all

  private

  def downcase_nickname
    nickname.downcase!
  end
end
