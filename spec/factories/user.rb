FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.last_name }
    email                  {Faker::Internet.free_email }
    password               { 'tanaka777' }
    password_confirmation  { password }
    last_name              { '田たタ' }
    first_name             { '田たタ' }
    last_name_k            { 'タナカ' }
    first_name_k           { 'タナカ' }
    birthday               { '1930-01-01' }
  end
end
