FactoryBot.define do
  factory :item do
    list                    {Faker::Games::Zelda.item}
    detail                  {Faker::Games::Zelda.game}
    category_id             {2}
    shipping_charge_id      {2}
    prefecture_id           {2}
    days_to_ship_id         {2}
    selling_price           {350}
    situation_id            {2}
    image                   {Faker::Lorem.sentence}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

