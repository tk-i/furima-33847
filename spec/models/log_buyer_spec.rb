require 'rails_helper'

RSpec.describe LogBuyer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @log_buyer = FactoryBot.build(:log_buyer, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
  
  describe "商品購入機能" do
    context "購入できる時" do
      it "必須項目を全て記入すれば購入できる" do
        expect(@log_buyer).to be_valid
      end

      it "建物名がなくても登録できる" do
        @log_buyer.address2 = nil
        expect(@log_buyer).to be_valid
      end
    end

    context "購入できない時" do
      it "郵便番号が空だと保存できないこと" do
        @log_buyer.postal = nil
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Postal can't be blank")
      end

      it "郵便番号の保存にはハイフンが必要であること" do
        @log_buyer.postal = '1111111'
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end

      it "都道府県が空だと保存できないこと" do
        @log_buyer.area_id = 1
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Area can't be blank")
      end

      it "市長区村が空だと保存できないこと" do
        @log_buyer.city = nil
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空だと保存できないこと" do
        @log_buyer.address = nil
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号は11桁以内の数値のみ保存可能なこと" do
        @log_buyer.phone = 12345
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Phone is invalid")
      end
      
      it "電話番号は全角数字では保存できないこと" do
        @log_buyer.phone = '０９０１２３４５６７８'
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Phone is not a number")
      end

      it "電話番号は半角英数混合では保存できないこと" do
        @log_buyer.phone = 'O9OlOOS054I'
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Phone is not a number")
      end

      it "電話番号は半角英語だけでは登録できないこと" do
        @log_buyer.phone = 'OSOlSIOOlSI'
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Phone is not a number")
      end

      it "userが紐づいていないと保存できないこと" do
        @log_buyer.user_id = nil
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("User can't be blank")
      end

      it "Itemが紐づいていないと保存できないこと" do
        @log_buyer.item_id = nil
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Item can't be blank")
      end

      it "トークンがなければ購入できないこと" do
        @log_buyer.token = nil
        @log_buyer.valid?
        expect(@log_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end