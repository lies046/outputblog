require 'rails_helper'
describe User do
  describe '#create' do

    #nickname,email,password,password確認があれば登録できる
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    #nicknameなしでは登録できない
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    #emailなしでは登録できない
    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    #メールアドレスが重複している場合は登録できない
    it "is invalid with a duplicate email address" do
      #はじめにユーザーを登録
      user = create(:user)
      #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    #passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    #passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

     #nicknameが7文字以上であれば登録できない
     it "is invalid with a nickname that has more than 7 characters " do
      user = build(:user, nickname: "aaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

      #nicknameが3文字以下では登録できない
      it "is valid with a nickname that has less than 6 characters " do
        user = build(:user, nickname: "aa")
        user.valid?
        expect(user.errors[:nickname]).to include("is too short (minimum is 3 characters)")
      end

      #nicknameが3文字6文字以下で登録できる
      it "is valid with a nickname that has less than 6 characters " do
        user = build(:user, nickname: "aaaaaa")
        user.valid?
        expect(user).to be_valid
      end

      #passwordが6文字以上であれば登録できること
      it "is valid with a password that has more than 6 characters " do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user).to be_valid
      end

      #passwordが5文字以下であれば登録できないこと
      it "is invalid with a password that has less than 5 characters " do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
  end
end