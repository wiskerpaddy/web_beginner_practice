class UsersController < ApplicationController
  def index
    @user = Profile.all
  end

  def show
    #if Profile.find_by(params[:url]) == "taro.html"
    @user = Profile.find_by(params["taro.html"])
    #end
  end
end
