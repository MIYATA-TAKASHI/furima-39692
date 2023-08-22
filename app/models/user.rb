class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthdate, presence: true

  private

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{6,}$/
    errors.add :password, "は半角英数字混合で、6文字以上で入力してください"
  end
end
