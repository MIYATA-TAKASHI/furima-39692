require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが入力されていないと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = '山田a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが正しいフォーマットでなければ登録できない' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'kana_last_nameが正しいフォーマットでなければ登録できない' do
        @user.kana_last_name = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end

      it 'kana_first_nameが正しいフォーマットでなければ登録できない' do
        @user.kana_first_name = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end

      it 'birthdateが空では登録できない' do
        @user.birthdate = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end

      it '姓（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '姓（カナ）が空だと登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it '名（カナ）が空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'Pass1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で、6文字以上で入力してください')
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で、6文字以上で入力してください')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '１２３４５６７'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で、6文字以上で入力してください')
      end

      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = 'Pass123'
        @user.password_confirmation = 'Pass1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
