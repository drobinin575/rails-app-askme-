class User < ApplicationRecord
  has_secure_password
  before_save :downcase_nickname

  validates :email, :nickname, presence: true, uniqueness: true
  validates :email, format: {
    with: /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/
  }
  validates :nickname, length: { in: 2..40, message: 'should contain 2-40 symbols' },
            format: { with: /\A\w+\z/, message: 'only allows letters, digits and _' }

  def downcase_nickname
    nickname.downcase!
  end
end
