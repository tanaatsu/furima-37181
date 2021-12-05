class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day

  has_one_attached :image

  belongs_to :user
  has_one    :record, dependent: :destroy

  has_many :comments

  validates  :name,   presence: true
  validates  :text,   presence: true
  validates :image,   presence: {message: "を選択してください"}

  validates  :category_id,     numericality: { other_than: 1, message: "を選択してください" }
  validates  :status_id,       numericality: { other_than: 1, message: "を選択してください" }
  validates  :postage_id,      numericality: { other_than: 1, message: "を選択してください" }
  validates  :prefecture_id,   numericality: { other_than: 1, message: "を選択してください" }
  validates  :shipping_day_id, numericality: { other_than: 1, message: "を選択してください" }
  validates  :price,           presence: true,
                               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                               format: { with: /\A[0-9]+\z/ }
end
