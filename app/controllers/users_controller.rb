class UsersController < ApplicationController
  def new
    @errors = []
  end

  def create
    user = User.create(
      username: params[:username],
      email: params[:email],
      bio: params[:bio]
    )
    respond_to do |format|
      if user.errors.any?
        @errors = user.errors
        format.html { render :new }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  def show
    if params[:id].to_i.to_s == params[:id]
      @user = User.find(params[:id])
    else
      @user = User.find_by(username: params[:id])
    end
  end

  def all
    @users = User.all
  end
end
