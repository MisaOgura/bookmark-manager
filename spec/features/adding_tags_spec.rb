feature 'Adding tags' do

  scenario 'I can add a tag to a link' do
    add_bbc
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end
end
