class CitiesController < ApplicationController
    def index
        @cities = City.all
    end
    def show
        @city = City.find_by!(slug: params[:slug]) # slug に基づいて検索
      end
end
