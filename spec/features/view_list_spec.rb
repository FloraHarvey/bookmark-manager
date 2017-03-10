# As a user
# So that I can go to web sites I regularly visit
# I would like to see a list of my saved links on the homepage

feature "Shows list of links" do
  scenario "User signs in, sees list of saved links" do
    link = Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    tag = Tag.create(tag_name: 'Coding')
    link.tags << tag
    link.save
    sign_up
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content("Makers Academy")
    end
  end
end
