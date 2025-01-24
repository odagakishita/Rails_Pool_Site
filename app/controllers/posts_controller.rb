class PostsController < ApplicationController
    helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def index
    end

    def logged_in?
      current_user.present?
    end

    def new_routine
      @post = Post.new
      @type = "ルーティーン"
      render :new_routine
    end
  
    def new_review
      @post = Post.new
      @type = "レビュー"
      render :new_review
    end

    def show 
        @post = Post.find(params[:id])

    end

    def index
        if params[:search].present?
            @posts = Post.where("title LIKE ? OR category LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").order(created_at: :desc)
        else
            @posts = Post.all.order(created_at: :desc)
        end
    end
      
  
    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
          redirect_to post_path(@post), notice: "#{@post.category}記事を投稿しました！"
        else
            puts @post.errors.full_messages # コンソールにエラーを表示
    flash.now[:alert] = "記事の保存に失敗しました: #{@post.errors.full_messages.join(", ")}"
          if @post.category == "ルーティーン"
            render :new_routine, status: :unprocessable_entity
          elsif @post.category == "レビュー"
            render :new_review, status: :unprocessable_entity
          else
            render :new, status: :unprocessable_entity
          end
        end
      end
      
      
  
      private

      def post_params
        params.require(:post).permit(:title, :content, :category, :review_rating, :pool_id, routine_steps: [])
      end
end