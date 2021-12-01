FactoryBot.define do
  factory :record_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '名古屋市' }
    address { '1-1' }
    telephone_num { '12345678910' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
