class DonationForm

  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building, :phone_number, :user_id, :item_id, :token, :donation_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/}
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, length: {maximum: 11, message: "is out of setting range"}
    validates :user_id
    validates :item_id
  end

  def save
    @order = Order.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number,building: building, phone_number: phone_number, donation_id: donation_id)
    @donation = Donation.new(item_id: item_id, user_id: user_id)
  end

end