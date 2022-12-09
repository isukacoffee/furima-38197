FactoryBot.define do
  factory :purchase_shipping do
    post_code                      {"111-1111"}
    prefecture_id                  {2}
    municipality                   {'神戸市'}
    address                        {'1-1'}
    building                       {'神戸ハイツ'}
    phone_number                   {'12345678911'}
    token                          {"tok_abcdefghijk00000000000000000"}
  end
end
