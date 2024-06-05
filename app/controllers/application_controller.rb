class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :turbo_stream?, :any_requests?
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def require_user
      return if logged_in?

      flash[:alert]="You must be logged in to perform that action"
      redirect_to login_path
    end

    def turbo_stream?
      formats.any?(:turbo_stream)
    end

    def any_requests?
      current_user.n_friends.any?
    end
end
