feature 'Adding tags' do

  scenario 'I can add a tag to a link' do
    visit '/links/new'

    fill_in('url', with: 'http://www.bbc.co.uk')
    fill_in('title', with: 'BBC')
    fill_in('tags', with: 'news')
    click_button('Submit')

    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end
end
