# As a user
# So that I can save a website I'm interested in
# I would like to add the site's address and title to my bookmark manager

feature "Save new link" do

  scenario "User can save a new link to the bookmark manager" do
    sign_up
    visit '/links'
    click_button 'Add Link'
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: ('http://www.makersacademy.com/')
    fill_in :tag1, with: ('Coding')
    click_button 'Save Link'
    expect(page).to have_content("Makers Academy")
  end
end
