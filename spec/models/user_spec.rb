require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do 
      it "nicknameが登録できる時" do 
       @user.nickname = "あa"
      end 
    end 

    context '新規登録がうまくいかないとき' do

    it "nicknameが空だと登録できない" do
      @user.nickname = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "emailが空では登録できない" do 
      @user.email = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "emailの@がなければでは登録できない" do 
      @user.email = "saco.jp"   
      @user.valid?  
    end

    it "emailの一意性でなければでは登録できない" do 
      @user.email = ""    
      @user.valid?  
    end

    it "passwordが空では登録できない" do
      @user.password = ""  
      @user.valid?
    end

    it "passwordが全角英数字混合では登録できない" do
      @user.password = "１２３XYZ"   
      @user.valid?  
    end

    it "passwordが5文字では登録できない" do
      @user.password = "12abc"    
      @user.valid?  
    end

    it "passwordがパスワードとパスワード（確認用）、値の一致していない時登録できない" do
      @user.password = "123abc,213abc"  
      @user.valid?  
    end

    it "passwordが半角英字のみの場合登録できない" do
      @user.password = "abcdef"   
      @user.valid?  
    end

    it "passwordが半角数字のみの場合登録できない" do
      @user.password = "123456"   
      @user.valid?  
    end

    it "first_nameが空では登録できない" do
      @user.first_name = ""   
      @user.valid?  
    end

    it "first_nameがひらがな、カナ文字、漢字以外では登録できない" do
      @user.first_name = "yamada"   
      @user.valid?  
    end

    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""    
      @user.valid?  
    end

    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""    
      @user.valid?  
    end

    it "first_name_kanaがひらがなでは登録できない" do
      @user.first_name_kana = "あいうえお"   
      @user.valid?  
    end
    
    it "last_nameが空では登録できない" do
      @user.last_name = ""    
      @user.valid?  
    end

    it "last_nameがひらがな、カナ文字、漢字以外では登録できない" do
      @user.last_name = "tarou"   
      @user.valid?  
    end

    it "last_name_kanaがひらがなでは登録できない" do
      @user.last_name_kana = "あいうえお"    
      @user.valid?  
    end

    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""   
      @user.valid?  
    end

    it "birth_dayが空では登録できない" do
      @user.birth_day = ""    
      @user.valid?  
    end
  end
end
end
