describe 'Basic authentication', type: :feature do
  it 'should redirect a signed out user to the login page' do
    visit root_path

    expect(page).to have_css('.js-login-form')
  end

  it 'should allow a new user to login' do
    user = login_user

    expect(page).to have_css('.js-logout-btn')
    expect(page).to have_content("Welcome to the OGP demo #{user.first_name}")
  end

  context 'when the user is logged in' do
    let!(:user) { login_user }

    it 'should allow a user to logout' do
      expect(page).to have_css('.js-logout-btn')

      find('.js-logout-btn').click

      expect(page).to have_content("Sorry to see you go #{user.first_name}!")
    end
  end
end
