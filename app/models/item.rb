class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_postage
  belongs_to :area
  belongs_to :status
  belongs_to :day
  has_many :order
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
   validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  #  validates :name, length: { maximum: 40 }
   validates :text
   validates :category_id, numericality: { other_than: 1  }
   validates :status_id, numericality: { other_than: 1 }
   validates :item_postage_id, numericality: { other_than: 1 }
   validates :area_id, numericality: { other_than: 1 }
   validates :day_id, numericality: { other_than: 1 }
   validates :item_price
  end
end