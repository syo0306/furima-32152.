class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_postage
  belongs_to :area
  belongs_to :status
  belongs_to :day
  belongs_to :user
  belongs_to :donation
  has_one_attached :image

  with_options presence: true do
   validates :name
   validates :text
   validates :image
   with_options numericality: { other_than: 1  } do
     validates :category_id
     validates :status_id
     validates :item_postage_id
     validates :area_id
     validates :day_id
   end
   validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end
  
  def was_attached?
    self.image.attached?
  end
end