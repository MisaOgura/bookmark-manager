feature 'Viewing links' do

  scenario 'I can see saved links on the links page' do
    Link.create(title: 'Google', url: 'https://www.google.co.uk')

    visit '/links'
    expect(page.status_code).to eq 200

    # within 'ul#links' do
    expect(page).to have_content('Google')
  end
end
