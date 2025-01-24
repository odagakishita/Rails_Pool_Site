class PoolsController < ApplicationController
    def show
        @pool = Pool.find(params[:id])
        @posts = @pool.posts
        #URLからpoolのIDを取得
    end

    def search
      @pools = Pool.all # 初期化
      @pools = Pool.joins(:city).where(cities: { slug: params[:city] }) if params[:city].present?
  
      # 条件を動的に追加
      @pools = @pools.where(outdoor: true) if params[:outdoor] == "1"
      @pools = @pools.where(sauna: true) if params[:sauna] == "1"
      @pools = @pools.where(fifty: true) if params[:fifty] == "1"
      @pools = @pools.where("adult_price <= ?", params[:max_price].to_i) if params[:max_price].present?
      
      @pools = @pools.to_a # 空の結果でもnilにならないように配列化
      render :index
    end
end
