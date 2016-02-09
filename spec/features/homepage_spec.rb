feature 'homepage' do
  scenario 'displays a list of links' do
     Link.create(
      title: "CRUD",
      url: "http://datamapper.org/docs/create_and_destroy.html"
      )
    visit('/')
    expect(page).to have_content 'Title: URL'
  end
end