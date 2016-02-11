feature 'Adding tags' do
  scenario 'adds a tag to a new link' do
    visit('/new')
    fill_in(:title, with: "Instagram")
    fill_in(:url, with: "http://instagram.com")
    fill_in(:tag, with: "social-media")
    click_button("Submit")
    expect(current_path).to eq '/'

    within 'ul#links' do
      expect(page).to have_content("Instagram #social-media")
    end
  end
end