class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    before_action :set_user, only: [:show, :edit, :update]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user, notice: "登録が完了しました"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
        @user = User.find(params[:id])

        # パスワードが空の場合は削除
        user_params_filtered = user_params
        if user_params_filtered[:password].blank? && user_params_filtered[:password_confirmation].blank?
            user_params_filtered = user_params_filtered.except(:password, :password_confirmation)
        end

        if @user.update(user_params)
          flash[:success] = "プロフィールが更新されました"
          redirect_to @user
        else
          Rails.logger.error("更新失敗: #{@user.errors.full_messages}") # エラーをログに記録
          flash.now[:error] = "更新に失敗しました: #{@user.errors.full_messages.join(", ")}"
          render :edit, status: :unprocessable_entity
        end
    end
  
    private

    #ログイン中かどうか
    def require_login
        unless logged_in?
            redirect_to login_path, alert; 'ログインしてください。'
        end
    end

    def correct_user
        @user = User.find(params[:id])
        unless @user == current_user
          redirect_to user_path(@user), alert: '他のユーザーの編集はできません。'
        end
      end
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :nickname, :profile_image)
    end
  end
  