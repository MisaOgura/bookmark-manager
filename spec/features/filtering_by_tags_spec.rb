feature 'Filtering by tags' do

  scenario 'I can filter links by a tag' do
    add_ruby_doc
    add_bbc
    add_daily_mail
    visit '/tags/news'
    expect(page).to have_content('BBC' && 'Daily Mail')
  end
end
