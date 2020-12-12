require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do	
      it "商品名が登録できてる時" do
        @item.name = "aあ"
        @item.valid?
      end	
    end	

    context '商品出品登録がうまくいかないとき' do

    it "商品名が空だと登録できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品説明が空では登録できない" do 
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "カテゴリー情報がないと登録できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品状態の情報がないと登録できない" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "送料負担の情報がないと登録できない" do
      @item.item_postage_id = nil
      @item.valid?
    end

    it "発送元の地域の情報がないと登録できない" do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it "配送までの日付の情報がないと登録できない" do
      @item.day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end

    it "価格の情報がないと登録できない" do
      @item.item_price = nil
      @item.valid?
    end

    it "価格の範囲が、¥300~¥9,999,999の間でないと登録できない" do
      @item.item_price = "¥10,¥10,000,000"
      @item.valid?
    end

    it "価格が半角数字ないと登録できない" do
      @item.item_price = "１２３４"
      @item.valid?
    end
  end
end
end
