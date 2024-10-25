require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    @record_address = FactoryBot.build(:record_address)
  end

  describe '商品購入' do
    #正常系
    context '購入できる場合' do
      it '全ての項目が正しく入力されていれば購入できる' do
      end
      #building
      it '建物の名前はなくても購入できる' do
      end
    end

    #異常系
    context '購入できない場合' do
      #token
      it 'トークンがないと購入できない' do
      end
      #post_code
      it '郵便番号が入力されていないと購入できない' do
      end
      it '郵便番号にハイフンがないと購入できない' do
      end
      it 'ハイフンの前は3文字でないと購入できない' do
      end
      it 'ハイフンの後は4文字でないと購入できない' do
      end
      it '全角ひらがながあると購入できない' do
      end
      it '全角カタカナがあると購入できない' do
      end
      it '漢字があると購入できない' do
      end
      it '数字があると購入できない' do
      end
      it '半角ｶﾀｶﾅがあると購入できない' do
      end
      #prefecture_id
      it '都道府県が1の---だと購入できない' do
      end
      #municipality
      it '市区町村の名前がないと購入できない' do
      end
      #block
      it '番地の名前がないと購入できない' do
      end
      #phone_num
      it '電話番号がないと購入できない' do
      end
      it 'ハイフンがあると購入できない' do
      end
      it '9文字以下だと購入できない' do
      end
      it '12文字以上だと購入できない' do
      end
      it '全角ひらがながあると購入できない' do
      end
      it '全角カタカナがあると購入できない' do
      end
      it '漢字があると購入できない' do
      end
      it '全角数字があると購入できない' do
      end
      it '半角ｶﾀｶﾅがあると購入できない' do
      end
  end
end
