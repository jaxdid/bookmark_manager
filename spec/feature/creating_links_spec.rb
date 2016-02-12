feature 'Creating links' do
  scenario 'can add a link to the page' do
    visit('/new')
    fill_in(:title, with: "Twitter")
    fill_in(:url, with: "http://twitter.com")
    click_button("Submit")
    expect(current_path).to eq '/'
      
    within 'ul#links' do
      expect(page).to have_content("Twitter")
    end
  end
end