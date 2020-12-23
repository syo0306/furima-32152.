FactoryBot.define do
  factory :donation_form do
    token {"1234567891234567"}
    postal_code  {"123456"}
    area_id {5}
    city     {"大阪市"}
    house_number  {"1"}
    phone_number  {"12345678901"}
  end
end
