feature "Adding a tag" do
  scenario "The user can input the tag name, and will see the tag has been added" do
    sign_up
    visit '/links'
    click_button 'Add Link'
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: ('http://www.makersacademy.com/')
    fill_in :tag1, with: ('Coding')
    click_button 'Save Link'
    expect(page).to have_content('Coding')
  end
end

feature "Adding multiple tags" do
  scenario "The user can input multiple tag names, and will see they have been added" do
    sign_up
    visit '/links'
    click_button 'Add Link'
    fill_in :title, with: 'Pinterest'
    fill_in :url, with: ('http://www.pinterest.com/')
    fill_in :tag1, with: ('Fashion')
    fill_in :tag2, with: ('Inspiration')
    click_button 'Save Link'
    expect(page).to have_content('Fashion Inspiration')
  end
end
