class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find_by(id: params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "yellow.png"
    )
    if @user.save
      flash[:notice] = "新規登録が完了しました"
      redirect_to("/users/index")
    else
      render("/users/new")
    end
  end
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("/home/vagrant/ruby_lessons/tweet_app/public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice] = "編集が完了しました"
      redirect_to("/users/index")
    else
      render("/users/edit")
    end
  end
  def login_form
  end
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      flash[:notice] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to("/users/index")
    else
      @error_message = "emailまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("/users/login_form")
    end
  end
end
