require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:test_item, user_id: @user.id)
    @record_address = FactoryBot.build(:record_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    #正常系
    context '購入できる場合' do
      it '全ての項目が正しく入力されていれば購入できる' do
        expect(@record_address).to be_valid
      end
      #building
      it '建物の名前はなくても購入できる' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end

    #異常系
    context '購入できない場合' do
      #token
      it 'トークンがないと購入できない' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      #post_code
      it '郵便番号が入力されていないと購入できない' do
        @record_address.post_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @record_address.post_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'ハイフンの前は3文字でないと購入できない' do
        @record_address.post_code = '12-3456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'ハイフンの後は4文字でないと購入できない' do
        @record_address.post_code = '123-456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号に全角ひらがながあると購入できない' do
        @record_address.post_code = '123-あいうえ'
        @record_address.valid?

        expect(@record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号に全角カタカナがあると購入できない' do
        @record_address.post_code = '123-アイウエ'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号に漢字があると購入できない' do
        @record_address.post_code = '123-四五六七'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号に全角数字があると購入できない' do
        @record_address.post_code = '123-４５６７'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号に半角カタカナがあると購入できない' do
        @record_address.post_code = '123-ｱｲｳ'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      #prefecture_id
      it '都道府県が1の---だと購入できない' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      #municipality
      it '市区町村の名前がないと購入できない' do
        @record_address.municipality = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipality can't be blank")
      end
      #block
      it '番地の名前がないと購入できない' do
        @record_address.block = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Block can't be blank")
      end
      #phone_num
      it '電話番号がないと購入できない' do
        @record_address.phone_num = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone num can't be blank")
      end
     it '電話番号にハイフンがあると購入できない' do
        @record_address.phone_num = '0120-999-999'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号に9文字以下だと購入できない' do
        @record_address.phone_num = '090123456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号に12文字以上だと購入できない' do
        @record_address.phone_num = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号に全角ひらがながあると購入できない' do
        @record_address.phone_num = '0120999あいう'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号に全角カタカナがあると購入できない' do
        @record_address.phone_num = '0120999アイウ'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号に漢字があると購入できない' do
        @record_address.phone_num = '01209999漢字'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号に全角数字があると購入できない' do
        @record_address.phone_num = '０１２０９９９９９９'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号に半角ｶﾀｶﾅがあると購入できない' do
        @record_address.phone_num = '0120999ｱｱｱ'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone num is invalid")
      end
      it 'userが紐付いていないと購入できない' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
