class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden_of_shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

  has_one    :order
  belongs_to :user
  has_many_attached :images

  def self.search(search)
    if search != ""
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  with_options presence: true do
  validates :name,           length: { maximum:40 }
  validates :explanation,    length: { maximum:1000 }
  validates :selling_price,  numericality: {  greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,  message: "が範囲外です"}
  validates :images    
  end
  validates :category_id,  numericality: { other_than: 1, message: "を選んでください" }
  validates :status_id, numericality: { other_than: 1, message: "を選んでください" }
  validates :burden_of_shipping_charge_id, numericality: { other_than: 1, message: "を選んでください" }
  validates :shipping_area_id, numericality: { other_than: 0, message: "を選んでください" }
  validates :days_to_ship_id, numericality: { other_than: 0, message: "を選んでください" }

end
