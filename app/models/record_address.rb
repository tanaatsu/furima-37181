class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address,
                :building_name, :telephone_num, :record_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'にハイフン(-)を含めて正しく入力してください' }
    validates :municipality
    validates :address
    validates :telephone_num, format: { with: /\A\d{10,11}\z/, message: 'を正しく入力してください' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, municipality: municipality, address: address,
                   telephone_num: telephone_num, prefecture_id: prefecture_id, record_id: record.id)
  end
end
