feature 'filtering tags' do
  scenario 'filter links by tag' do
    link = Link.create(url: 'http://x.com', title: 'X')
    tag = Tag.create(name: 'not_bubbles')
    LinkTag.create(link: link, tag: tag)
    link1 = Link.create(url: 'http://y.com', title: 'Y')
    tag1 = Tag.create(name: 'bubbles')
    LinkTag.create(link: link1, tag: tag1)
    visit('/tags/bubbles')
    expect(page).not_to have_content('X #not_bubbles')
    expect(page).to have_content('Y #bubbles')
  end
end