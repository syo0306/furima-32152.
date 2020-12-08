require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      user = User.new(email: "abc", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できない" do
      user = User.new(password: "abc", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
       user.valid?
       expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "first_nameが空では登録できない" do
    end

    it "first_name_kanaが空では登録できない" do
    end

    it "last_nameが空では登録できない" do
    end

    it "last_name_kanaが空では登録できない" do
    end

    it "birth_dayが空では登録できない" do
    end
  end
end

