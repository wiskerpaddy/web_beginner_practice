class UsersController < ApplicationController
  def index
  end

  def show
    if params[:id] == "taro" then
      #p params[:id]#デバッグ用
      @user = Profile.find_by(url: "taro")

    elsif params[:id] == "jiro" then
      #p params[:id]#デバッグ用
      @user = Profile.find_by(url: "jiro")

    elsif params[:id] == "saburo" then
      #p params[:id]#デバッグ用
      @user = Profile.find_by(url: "saburo")

    else
      #エラー処理は考えていませんでした。
    end
  end
end
