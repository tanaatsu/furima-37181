require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep(1)
  end

  describe '商品出品登録' do
    context '商品出品ができる時' do
      it 'name、text、price、image、category_id、status_id、postage_id、
               prefecture_id、shipping_day_id、userが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を選択してください")
      end
      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'category_idが---では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'status_idが---では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を選択してください")
      end
      it 'postage_idが---では出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'prefecture_idが---では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it 'shipping_day_idが---では出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'priceが半角数字ではないと出品できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが300以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it 'priceが9,999,999以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
      it 'userが紐づいてなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
