class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        current_user.present?
    end

    def redirect_if_logged_in
        if logged_in?
            redirect_to root_path, notice: "既にログイン済み"
        end
    end
end
