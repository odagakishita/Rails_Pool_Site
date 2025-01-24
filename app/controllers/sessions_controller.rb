class SessionsController < ApplicationController

    before_action :redirect_if_logged_in, only: [:new]

    def new 
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user&.authenticate(params[:session][:password])
            #ユーザーIDを保存
            session[:user_id] = user.id
            redirect_to user, notice: "ログインに成功しました！"
        else
            flash.now[:alert] = "メールアドレスまたはパスワードが間違っています"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "ログアウトしました"
    end
end
