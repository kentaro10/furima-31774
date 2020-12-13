require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品する商品の保存がうまくいく時' do
    it "全ての入力項目が入力されている時" do
      expect(@item).to be_valid
    end

    end

    context '出品する商品の保存がうまくいかない時' do
      it "商品画像がない時" do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it "商品の説明がない時" do
       @item.explanation = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("説明を入力してください")
      end

      it "商品名がない時" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it "カテゴリーの情報がない時" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選んでください")
      end

      it "商品の状態についての情報がない時" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選んでください")
      end

      it "配送料の負担についての情報がない時" do
        @item.burden_of_shipping_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選んでください")
      end

      it "発送元地域についての情報がない時" do
        @item.shipping_area_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選んでください")
      end

      it "発送までの日数についての情報がない時" do
        @item.days_to_ship_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選んでください")
      end

      it "価格についての情報がないとき" do
        @item.selling_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください", "価格が範囲外です")
      end

      it "価格の範囲が300円から9999999円以外の時" do
        @item.selling_price = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格が範囲外です")
      end

      it "販売価格が半角数字ではない時" do
        @item.selling_price = "１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格が範囲外です")
      end


    end

end
end
