require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    # 正常系
    context "新規登録できる場合" do
      it "全ての項目が正しく入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end

      # 異常系
    context "新規登録できない場合" do

      # nickname
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      # email
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が含まれていない場合は登録できない" do
        @user.email = "testemail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      # password
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password", "Password is invalid")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordはアルファベットのみでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordは数字のみでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password = "abc123"
        @user.password_confirmation = "abc1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      # 名字について
      it "last_name_kanjiが空では登録できない" do
        @user.last_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank", "Last name kanji is invalid")
      end

      it "last_name_kanjiが半角カタカナでは登録できない" do
        @user.last_name_kanji = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji is invalid")
      end

      it "last_name_kanjiが半角数字では登録できない" do
        @user.last_name_kanji = "0123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji is invalid")
      end

      it "last_name_kanjiが半角アルファベットでは登録できない" do
        @user.last_name_kanji = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji is invalid")
      end

      # 名前について
      it "first_name_kanjiが空では登録できない" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank", "First name kanji is invalid")
      end

      it "first_name_kanjiが半角ｶﾀｶﾅでは登録できない" do
        @user.first_name_kanji = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji is invalid")
      end

      it "first_name_kanjiが半角数字では登録できない" do
        @user.first_name_kanji = "0123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji is invalid")
      end

      it "first_name_kanjiが半角アルファベットでは登録できない" do
        @user.first_name_kanji = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji is invalid")
      end

      # フリガナの名字
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end

      it "last_name_kanaが全角ひらがなでは登録できない" do
        @user.last_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが全角漢字では登録できない" do
        @user.last_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが半角ｶﾀｶﾅでは登録できない" do
        @user.last_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが半角数字では登録できない" do
        @user.last_name_kana = "0123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが半角アルファベットでは登録できない" do
        @user.last_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      # フリガナの名前
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end

      it "first_name_kanaが全角ひらがなでは登録できない" do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが全角漢字では登録できない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが半角ｶﾀｶﾅでは登録できない" do
        @user.first_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが半角数字では登録できない" do
        @user.first_name_kana = "0123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが半角アルファベットでは登録できない" do
        @user.first_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      # 誕生日
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
