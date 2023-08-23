require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it '正常な値で登録できること' do
      user = build(:user,
                   nickname: 'test_user',
                   email: 'test@example.com',
                   last_name: '山田',
                   first_name: '太郎',
                   kana_last_name: 'ヤマダ',
                   kana_first_name: 'タロウ',
                   birthdate: Date.new(1990, 1, 1),
                   password: 'Password123'
      )
      expect(user).to be_valid
    end
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      before do
        @user = build(:user)
      end

      it 'nicknameが入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'last_nameが正しいフォーマットであれば登録できる' do
        expect(@user).to be_valid
      end

      it 'first_nameが正しいフォーマットであれば登録できる' do
        expect(@user).to be_valid
      end

      it 'kana_last_nameが正しいフォーマットであれば登録できる' do
        expect(@user).to be_valid
      end

      it 'kana_first_nameが正しいフォーマットであれば登録できる' do
        expect(@user).to be_valid
      end

      it 'birthdateが正しく選択されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      before do
        @user = build(:user)
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが一意でなければ登録できない' do
        existing_user = create(:user, email: 'test@example.com') # 既存ユーザーの作成
        @user.email = existing_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに＠が含まれていなければ登録できない' do
        @user.email = 'invalid_email'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'last_nameが正しいフォーマットでなければ登録できない' do
        @user.last_name = '123'
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
    end
  end
end
