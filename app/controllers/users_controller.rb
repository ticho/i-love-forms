class UsersController < ApplicationController

  # Initializing @errors

  def new
    @errors = []
  end
  
  def new_html
    @errors = []
  end

  # rendering the errors if they exist, redirectiong toward homepage otherwise
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

  # making it possible to type in a username in the URL
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

  # initializing @errors
  def new_for
    @errors = [] if !@errors
    @user = User.new
  end

  # redirectiong to error page if there was an error
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
  
  # needed this for the form_for way, otherwise strong parameters aren't allowed to be touched this way
  def user_params
    params.require(:user).permit(:username, :email, :bio)
  end
end
