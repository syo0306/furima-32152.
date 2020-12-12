require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do	
      it "全ての値が存在するときに保存できる" do
      end	
    end	

    context '商品出品登録がうまくいかないとき' do

    it "画像が空では保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

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
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品状態の情報がないと登録できない" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "送料負担の情報がないと登録できない" do
      @item.item_postage_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item postage must be other than 1")
    end

    it "発送元の地域の情報がないと登録できない" do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end

    it "配送までの日付の情報がないと登録できない" do
      @item.day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end

    it "価格の情報がないと登録できない" do
      @item.item_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price can't be blank")
    end

    it "価格のが、300円以上でないと登録できない" do
      @item.item_price = "10"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is out of setting range")
    end

    it "価格が、10,000,000円以上では登録ができない" do
      @item.item_price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is out of setting range")
    end

    it "価格が半角数字ないと登録できない" do
      @item.item_price = "１２３４"
      @item.valid?
    end
  end
end
end
