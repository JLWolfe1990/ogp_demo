module Helpers
  module Authentication
    # in a larger project, this would be refactored to address the session directly for speed
    def login_user
      visit login_path

      fill_in('user_full_name', with: 'Bob Marley')

      expect {
        find("input[type='submit']").click()
        expect(page).to have_css('.alert-success', wait: 2)
      }.to change { User.count }.by(1)

      User.last
    end

    def logout_user
      visit session_path(method: :delete)
    end
  end
end

RSpec.configure do |configure|
  configure.include Helpers::Authentication, type: :feature
end
