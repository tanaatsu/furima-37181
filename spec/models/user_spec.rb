require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
     it 'nicknameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kとfirst_name_kとbirthdayが存在すれば登録できる' do
       expect(@user).to be_valid
     end
   end
   context '登録できないとき' do
     it 'nicknameが空では登録できない'do
      
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailが空では登録できない'do
      
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが空では登録できない'do
      
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordが5文字以下では登録できない'do
      
       @user.password = '00000'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it 'password_confirmationとパスワードが一致しないと登録できない'do
      
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end  
     it 'last_nameが空では登録できない'do
      
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it 'first_nameが空では登録できない'do
      
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'first_name_kが空では登録できない'do
      
       @user.last_name_k = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name k can't be blank")
     end
     it 'first_name_kが空では登録できない'do
      
       @user.first_name_k = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name k can't be blank")
     end
     it 'birthdayが空では登録できない'do
      
       @user.birthday = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
   end 
  end
end

# bundle exec rspec spec/models/user_spec.rb
