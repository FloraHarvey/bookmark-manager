def sign_up
  visit ('/')
  fill_in :email, with: "ilovemangos@gmail.com"
  fill_in :password, with: "sweetandjuicy"
  click_button 'Sign Up'
end 
