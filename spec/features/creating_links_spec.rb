feature 'Creating links' do

  scenario 'I can create a new link' do
    visit '/links/new'
    count = Link.all.count

    fill_in('url', :with => 'http://ruby-doc.org/core-2.3.0/')
    fill_in('title', :with => 'Ruby-doc')
    click_button('Submit')

    within 'ul#links' do
      expect(page).to have_content('Ruby-doc')
    end

    within 'div#count' do
      expect(page).to have_content("#{count+1}")
    end
  end
end
