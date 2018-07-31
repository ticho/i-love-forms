class UsersController < ApplicationController
  def new
    @errors = []
  end
  
  def new_html
    @errors = []
  end

  def create
    user = User.create(
      username: params[:username],
      email: params[:email],
      bio: params[:bio]
    )
    if user.errors.any?
      @errors = user.errors
      render :new
    else
      redirect_to root_path
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

  def new_for
    puts "THERE"
    puts @errors
    puts "THERE"
    @errors = [] if !@errors
    @user = User.new
  end

  def create_for
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      @errors = @user.errors
      puts @errors.messages
      redirect_to '/users/error'
    end
  end


  def error
  end

  private 

  def user_params
    params.require(:user).permit(:username, :email, :bio)
  end
end
