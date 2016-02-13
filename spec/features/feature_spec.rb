feature "Display list of links" do
  scenario "displays all links in the list of links" do
    Link.create(url: 'http://www.google.com', title: 'Google')
    visit '/'
    expect(page).to have_content 'Google'
  end
end
