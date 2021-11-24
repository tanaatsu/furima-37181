FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    email                  { 'test@yahoo.co.jp' }
    password               { 'tanaka777' }
    password_confirmation  { password }
    last_name              { '田たタ' }
    first_name             { '田たタ' }
    last_name_k            { 'タナカ' }
    first_name_k           { 'タナカ' }
    birthday               { '1930-01-01' }
  end
end
