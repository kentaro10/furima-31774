require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    # ユーザー１
    # ユーザー２
    # 商品
    # オーダー
    @order_form = FactoryBot.build(:order_form)
  end

 describe '商品購入' do
   context '商品購入情報が保存される時' do
     it '全て入力されている時' do
      expect(@order_form).to be_valid
     end
     it "建物名が空でも保存される" do
      @order_form.building_name = ""
      @order_form.valid?
      expect(@order_form).to be_valid
     end
   end
   context '商品購入情報が保存されない時' do
    it "郵便番号がないと保存されない" do
      @order_form.postal_code = ""
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include()
      end
      it "郵便番号の入力にはハイフンが必要" do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号を入力してください。ハイフンを付けてください。")
      end
      it"都道府県が選択されていないと保存できない" do
        @order_form.prefecture_id = "0"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("都道府県を選択してください。")
      end
      it"市町村が空だと保存できない" do
        @order_form.cities_towns_and_villages = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("市町村を入力してください")
       end
       it"番地が空だと保存できない" do
        @order_form.street_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("番地を入力してください")
       end
       it"電話番号が空だと保存できない" do
        @order_form.telephone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
       end
       it "電話番号にはハイフンがあると保存できない" do
        @order_form.telephone_number = "090-1234-3333"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は不正な値です")
       end
       it "電話番号は11桁いないでないと保存できない" do
        @order_form.telephone_number = "0901234456554"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は不正な値です")
       end
       it "トークンが空だと保存できない" do
        @order_form.token = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("カード情報を入力してください")
       end


   end
 end
end
