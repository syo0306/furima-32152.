require 'rails_helper'

RSpec.describe DonationForm, type: :model do
  before do
    @donation_form = FactoryBot.build(:donation_form)
  end


  describe '商品購入登録' do
    context '商品購入登録がうまくいくとき' do	
      it "全ての値が存在するときに保存できる" do
        expect(@donation_form).to be_valid
      end	
    end	

   context '商品購入登録がうまくいかないとき' do

    it "クレジットカード情報が空だと登録できない" do
      @donation_form.token = nil
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が空だと登録できない" do
      @donation_form.postal_code = nil
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号にハイフンがあると登録できない" do 
      @donation_form.postal_code = "123-4567"
      @donation_form.valid?
    end

    it "都道府県がないと登録できない" do
      @donation_form.area_id = 1
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Area must be other than 1")
    end

    it "市町村が空だと登録できない" do
      @donation_form.city = nil
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("City can't be blank")
    end

    it "番地が空だと登録できない" do
      @donation_form.house_number = nil
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("House number can't be blank")
    end

    it "電話番号が空だと登録できない" do
      @donation_form.phone_number = nil
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号にハイフンあると登録できない" do
      @donation_form.phone_number = "123-4567-8910"
      @donation_form.valid?
    end

    it "電話番号が11桁以上であると登録できない" do
      @donation_form.phone_number = "123-4567-89101"
      @donation_form.valid?
    end
  end
end
end
