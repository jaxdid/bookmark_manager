

feature 'filtering tags' do

    before(:each) do
        Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
        Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search engine')])
        Link.create(url: 'http://www.zombo.com', title: 'Zombo', tags: [Tag.first_or_create(name: 'bubbles')])
        Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble-Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
    end

  scenario 'filter links by tag' do
    visit('/tags/bubbles')
    expect(page.status_code).to eq(200)
    within 'ul#links' do
    expect(page).not_to have_content('Makers Academy')
    expect(page).not_to have_content('Google')
    expect(page).to have_content('Zombo')
    end
  end
end