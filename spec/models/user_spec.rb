require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nickname,email,passwaord,password_confirmation,first_name,second_name,first_name_kana,second_name_kana,birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
      end
      it "passwordが英数字含む６文字以上の時登録されること" do
      @user.password = "12345556a"
      @user.password_confirmation = "12345556a"
      @user.valid?
      expect(@user).to be_valid
      end
    end
  context '新規登録がうまくいかない時' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールは＠が必要です")
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it "emailは＠を含まないと登録できない"do
    @user.email = "aaa.com"
    @user.valid?
    expect(@user.errors.full_messages).to include("Eメールは不正な値です", "Eメールは＠が必要です")
    end

    it "passwordが空では登録できない"do
    @user.password = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは半角6文字以上の英数字それぞれ一文字以上含む必要があります", "パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordが5文字以下だと登録できない"do
      @user.password = "1234a"
      @user.password_confirmation = "1234a"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456aaa"
      @user.password_confirmation = "1234567aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "first_nameが空では登録できない"do
    @user.first_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字は、ひらがなかカタカナか漢字である必要があります")
    end
    it "first_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.first_name = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字は、ひらがなかカタカナか漢字である必要があります")
    end
    it "passwordが全角では登録できない" do
      @user.password = "１２３４５６７A"
      @user.password_confirmation = "１２３４５６７A" 
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角6文字以上の英数字それぞれ一文字以上含む必要があります")
    end
    it "passwordが数字だけだと登録できない"do
    @user.password = "1234567"
    @user.password_confirmation = "1234567"
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードは半角6文字以上の英数字それぞれ一文字以上含む必要があります")
  end
  it "passuwordが英字だけだと登録できない" do
    @user.password = "abcdefgh"
    @user.password_confirmation = "abcdefgh"
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードは半角6文字以上の英数字それぞれ一文字以上含む必要があります")
  end
    it "second_nameが空では登録できない"do
    @user.second_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("名前を入力してください", "名前は、ひらがなかカタカナか漢字である必要があります")
    end
    it "second_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.second_name = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は、ひらがなかカタカナか漢字である必要があります")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字は、カタカナである必要があります")
    end
    it "first_name_kanaが全角カタカナ以外では登録できないこと" do
      @user.first_name_kana = "ああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字は、カタカナである必要があります")
    end
    it "second_name_kanaが空では登録できない"do
    @user.second_name_kana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("名前を入力してください", "名前は、カタカナである必要があります")
    end
    it "second_name_kanaが全角カタカナ以外では登録できないこと" do
      @user.second_name_kana = "ああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は、カタカナである必要があります")
    end
    it "生年月日が空では登録できない"do
    @user.birthday = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
  end
end