feature 'User signup' do

  scenario 'When a new user signs up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome! whatever@gmail.com')
    expect(User.first.address).to eq('whatever@gmail.com')
  end
end
