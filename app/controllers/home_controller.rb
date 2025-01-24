class HomeController < ApplicationController
    helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def index
    end

    def logged_in?
      current_user.present?
    end


    def index
      if params[:search].present?
          @posts = Post.where("title LIKE ? OR category LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").order(created_at: :desc)
      else
          @posts = Post.all.order(created_at: :desc)
      end
    end
end
