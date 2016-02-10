feature 'create links form' do
  scenario 'add title and url' do
    visit('/links/new')
    fill_in(:title, with: "Google")
    fill_in(:url, with: "http://google.com")
    click_button('Submit')
    expect(page).to have_content("Google")
  end
end