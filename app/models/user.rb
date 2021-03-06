class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,                           format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'を正しく入力してください'}
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を正しく入力してください'}
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を正しく入力してください'}
  validates :last_name_k,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角カタカナで入力してください'}
  validates :first_name_k,       presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角カタカナで入力してください'}
  validates :birthday,           presence: true

  has_many :items, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :comments
end
