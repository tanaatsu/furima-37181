require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  context '内容に問題がない時' do
    it '全て正しく入力されていれば保存できる' do
      expect(@record_address).to be_valid
    end
    it '建物名は空でも登録できる' do
      @record_address.building_name = ''
      expect(@record_address).to be_valid
    end
  end

  context '内容に問題がある時' do
    it 'postal_codeが空では登録できない' do
      @record_address.postal_code = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'postal_codeは半角数字ではないと登録できない' do
      @record_address.postal_code = '１２３４５６７'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include('郵便番号にハイフン(-)を含めて正しく入力してください')
    end
    it 'prefecture_idが「-」であると登録できない' do
      @record_address.prefecture_id = 1
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("都道府県を選択してください")
    end
    it 'municipalityが空だと登録できない' do
      @record_address.municipality = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("市町村を入力してください")
    end
    it 'addressが空であると登録できない' do
      @record_address.address = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("番地を入力してください")
    end
    it 'telephone_numが空だと登録できない' do
      @record_address.telephone_num = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'telephone_numは半角数字でないと登録できない' do
      @record_address.telephone_num = 'aaaaaaa'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include('電話番号を正しく入力してください')
    end
    it 'telephone_numは9桁以内では登録できない' do
      @record_address.telephone_num = '123456789'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include('電話番号を正しく入力してください')
    end
    it 'telephone_numは12桁以上では登録できない' do
      @record_address.telephone_num = '123456789123'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include('電話番号を正しく入力してください')
    end
    it 'userが紐づいていないと登録できない' do
      @record_address.user_id = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Userを入力してください")
    end
    it 'itemが紐づいていないと登録できない' do
      @record_address.item_id = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Itemを入力してください")
    end
    it 'tokenが空では登録できない' do
      @record_address.token = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
  end
end
