def add_ruby_doc
  visit '/links/new'
  fill_in('url', with: 'http://ruby-doc.org/core-2.3.0/')
  fill_in('title', with: 'Ruby-doc')
  fill_in('tags', with: 'ruby')
  click_button('Submit')
end

def add_bbc
  visit '/links/new'
  fill_in('url', with: 'http://www.bbc.co.uk')
  fill_in('title', with: 'BBC')
  fill_in('tags', with: 'news')
  click_button('Submit')
end

def add_daily_mail
  visit '/links/new'
  fill_in('url', with: 'http://www.dailymail.co.uk/')
  fill_in('title', with: 'Daily Mail')
  fill_in('tags', with: 'news')
  click_button('Submit')
end
