require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:test_item)
  end

  describe '商品出品' do
    # 正常系
    context '商品の出品ができる場合' do
      it '全ての項目があれば出品できる' do
      end
    end

    #異常系
    context '商品の出品ができない場合' do
      it '画像がないと出品ができない' do
      end
      it '商品の名前が空だと出品ができない' do
      end
      it '商品の説明が空だと出品ができない' do
      end
      it '商品のカテゴリーが1のｰｰｰだと出品ができない' do
      end
      it '送料が1の---だと出品ができない' do
      end
      it '発送元が1の---だと出品ができない' do
      end
      it '商品の到着日数が1の---だと出品ができない' do
      end
      it '価格が未入力だと出品ができない' do
      end
      it '価格が300円未満だと出品ができない' do
      end
      it '価格が9999999円より多いと出品ができない' do
      end
      it '価格に小数点があると出品できない' do
      end
    end
  end
end