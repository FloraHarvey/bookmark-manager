feature "Signing in" do
  scenario "The user can sign up with their email and password" do
    sign_up
    expect(page).to have_content("Welcome ilovemangos@gmail.com")
  end

  scenario "After signing up the user is added to the user count " do
    sign_up
    p User.all
    expect(User.count).to eq(1)
  end
end
