feature 'Creating links' do

  scenario 'I can create a new link' do
    count = Link.all.count
    add_ruby_doc
    within 'ul#links' do
      expect(page).to have_content('Ruby-doc')
    end

    within 'div#count' do
      expect(page).to have_content("#{count+1}")
    end
  end
end
