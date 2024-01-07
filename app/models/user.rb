class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/ }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  #validates :first_name_kana, presence: true
  #validates :last_name_kana, presence: true
  #validates :birthday, presence: true

end
