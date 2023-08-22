require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = build(:user, nickname: '')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = build(:user, email: '') 
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが一意でなければ登録できない' do
      existing_user = create(:user, email: 'test@example.com') # 既存ユーザーの作成
      user = build(:user, email: existing_user.email)
      user.valid?
      expect(user.errors.full_messages).to include('Email has already been taken')
    end

      it 'emailに＠が含まれていなければ登録できない' do
        user = build(:user, email: 'invalid_email')
        user.valid?
        expect(user.errors.full_messages).to include('Email is invalid')
      end

    it 'last_nameが正しいフォーマットでなければ登録できない' do
      user = build(:user, last_name: '123')
      user.valid?
      expect(user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが正しいフォーマットでなければ登録できない' do
      user = build(:user, first_name: '123')
      user.valid?
      expect(user.errors.full_messages).to include('First name is invalid')
    end

    it 'kana_last_nameが正しいフォーマットでなければ登録できない' do
      user = build(:user, kana_last_name: 'かな')
      user.valid?
      expect(user.errors.full_messages).to include('Kana last name is invalid')
    end

    it 'kana_first_nameが正しいフォーマットでなければ登録できない' do
      user = build(:user, kana_first_name: 'かな')
      user.valid?
      expect(user.errors.full_messages).to include('Kana first name is invalid')
    end

    it 'birthdateが空では登録できない' do
      user = build(:user, birthdate: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Birthdate can't be blank")
    end
  end
end
