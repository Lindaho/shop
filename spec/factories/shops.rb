FactoryBot.define do
  factory :shop, class: 'Shop' do
    name { Faker::Name.name_with_middle }
    tel { Faker::PhoneNumber.cell_phone }
  end
end
