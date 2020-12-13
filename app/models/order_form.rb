class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :cities_towns_and_villages, :street_number, :building_name, :telephone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code,    format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "を入力してください。ハイフンを付けてください。"}
    validates :token
    validates :cities_towns_and_villages
    validates :street_number
    validates :telephone_number, format: {with: /\A\d{10,11}\z/}
  end
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください。"}

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, cities_towns_and_villages: cities_towns_and_villages, street_number: street_number, telephone_number: telephone_number, building_name: building_name, prefecture_id: prefecture_id, order_id: order.id)
    

  end
end