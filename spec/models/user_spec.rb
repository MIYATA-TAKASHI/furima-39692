require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameが入力されていれば登録できる' do
      end
      it 'last_nameが正しいフォーマットであれば登録できる' do
      end
      it 'first_nameが正しいフォーマットであれば登録できる' do
      end
      it 'kana_last_nameが正しいフォーマットであれば登録できる' do
      end
      it 'kana_first_nameが正しいフォーマットであれば登録できる' do
      end
      it 'birthdateが正しく選択されていれば登録できる' do
      end
      it 'パスワードが6文字以上かつ半角英数字混合であれば登録できる' do
      end
    end
    context '新規登録できない場合' do
      it 'emailが一意でなければ登録できない' do
      end
      it 'emailに＠が含まれていなければ登録できない' do
      end
      it 'last_nameが正しいフォーマットでなければ登録できない' do
      end
      it 'first_nameが正しいフォーマットでなければ登録できない' do
      end
      it 'kana_last_nameが正しいフォーマットでなければ登録できない' do
      end
      it 'kana_first_nameが正しいフォーマットでなければ登録できない' do
      end
      it 'birthdateが空では登録できない' do
      end
      it 'パスワードが6文字以上かつ半角英数字混合でなければ登録できない' do
      end
      it 'パスワードが空では登録できない' do
      end
      it '姓（全角）が空だと登録できない' do
      end
      it '名（全角）が空だと登録できない' do
      end
      it '姓（カナ）が空だと登録できない' do
      end
      it '名（カナ）が空だと登録できない' do
      end
      it 'パスワードが6文字未満では登録できない' do
      end
      it '英字のみのパスワードでは登録できない' do
      end
      it '数字のみのパスワードでは登録できない' do
      end
      it '全角文字を含むパスワードでは登録できない' do
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
      end
    end
  end
end