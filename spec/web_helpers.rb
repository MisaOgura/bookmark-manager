def create_makers_link
  visit('/links')
  click_button('New Link')
  fill_in :title, with: 'Makers Academy'
  fill_in :url, with: 'http://www.makersacademy.co.uk'
  fill_in :tags, with: 'coding'
  click_button('Submit Link')
end

def sign_up
  visit('/')
  fill_in :email, with: 'bob@bob.com'
  fill_in :password, with: 'password1'
end