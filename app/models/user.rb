class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_nickname

  has_many :questions, dependent: :delete_all
  has_many :authored_questions, class_name: 'Question', foreign_key: 'author_id', dependent: :nullify

  validates :email, :nickname, presence: true, uniqueness: true
  validates :email, format: {
    with: /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/
  }
  validates :nickname, length: { in: 2..40 }, format: { with: /\A\w+\z/ }

  def to_param
    nickname
  end

  private

  def downcase_nickname
    nickname.downcase!
  end
end
