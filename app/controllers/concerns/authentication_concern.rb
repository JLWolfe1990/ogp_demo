module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_user

    before_action :redirect_authenticated

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect_authenticated
      return redirect_to login_path unless current_user
      true
    end
  end
end