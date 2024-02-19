class UsersController < ApplicationController
  def index
    #@user = Profile.all
  end

  def show
    #user = Profile.find_by(url: params[:url])
    if params[:id] == "taro" then
      p params[:id] == "taro"
      user = Profile.find_by(url: "taro")
      @name = user.name
      @age = user.age
    elsif params[:id] == "jiro" then
      p params[:id] == "jiro"
      user = Profile.find_by(url: "jiro")
      @name = user.name
      @age = user.age
    elsif params[:id] == "saburo" then
      p params[:id] == "saburo"
      user = Profile.find_by(url: "saburo")
      @name = user.name
      @age = user.age
    else
      p params[:id]
    end
  end
end
