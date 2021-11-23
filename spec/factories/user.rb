FactoryBot.define do
  factory :user do
    nickname               {'test'}
    email                  {'test@yahoo.co.jp'}
    password               {'0000'}
    password_confirmation  {password}
    last_name              {'test'}
    first_name             {'test'}
    last_name_k            {'test'}
    first_name_k           {'test'}
    
  end
end