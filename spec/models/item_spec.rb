require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "登録できる時" do
      it "必須項目を全て記入すれば新規登録できる" do
        expect(@item).to be_valid
      end
    end

    context "登録できない時" do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が必須であること" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      
      it "商品の説明が必須であること" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "カテゴリーの情報が必須であること" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      
      it "商品の状態についての情報が必須であること" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      
      it "配送料の負担についての情報が必須であること" do
        @item.burden_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      
      it "発送元の地域についての情報が必須であること" do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      
      it "発送までの日数についての情報が必須であること" do
        @item.shipment_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment can't be blank")
      end
      
      it "販売価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      
      it "販売価格は、¥300以下では登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      
      it "販売価格は、¥9,999,999以上では登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      
      it "販売価格は半角数字のみ保存可能であること" do
        @item.price = "１５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end