require 'rails_helper'

RSpec.describe DonationForm, type: :model do
  before do
    @user = FactoryBot.build(:user )
    @item = FactoryBot.build(:item )
    @donation_form = FactoryBot.build(:donation_form, user_id:@user.id, item_id: @item.id)
  end


  describe '商品購入登録' do
    context '商品購入登録がうまくいくとき' do	
      it "全ての値が存在するときに保存できる" do
        expect(@donation_form).to be_valid
      end	

      it "建物の情報が無くても保存できる" do
        @donation_form.building = nil
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

    it "郵便番号にハイフンがないと登録できない" do 
      @donation_form.postal_code = "1234567"
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Postal code is invalid")
    end

    it "都道府県がないと登録できない" do
      @donation_form.area_id = 1
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Area must be other than 1")
    end

    it "都道府県がないと登録できない" do
      @donation_form.area_id = nil
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Area can't be blank")
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
      expect(@donation_form.errors.full_messages).to include("Phone number is out of setting range")
    end

    it "電話番号が12桁以上であると登録できない" do
      @donation_form.phone_number = "123456789101"
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Phone number is out of setting range")
    end

    it "電話番号が英数混合では登録できない" do
      @donation_form.phone_number = "1a2d2344313"
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Phone number is out of setting range")
    end

    it "user_idが空の場合、登録が出来ない" do
      @donation_form.user_id = nil
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空の場合、登録が出来ない" do
      @donation_form.item_id = nil
      @donation_form.valid?
      expect(@donation_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end
end
