def create_makers_link
  visit('/links')
  click_button('New Link')
  fill_in :title, with: 'Makers Academy'
  fill_in :url, with: 'http://www.makersacademy.co.uk'
  fill_in :tags, with: 'coding'
  click_button('Submit Link')
end

def sign_up_bob
  visit('/')
  fill_in :name, with: 'Bob'
  fill_in :email, with: 'bob@bob.com'
  fill_in :password, with: 'password1'
  fill_in :confirm_password, with: 'password1'
end

def sign_up_tom
  visit('/')
  fill_in :name, with: 'Tom'
  fill_in :email, with: 'tom@tom.com'
  fill_in :password, with: 'password2'
  fill_in :confirm_password, with: 'password2'
end

def sign_up(name: 'alice',
            email: 'alice@gmail.com',
            password: '123456',
            confirm_password: '123456')
  visit('/')
  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('confirm_password', with: confirm_password)
  click_button('New User')
end
