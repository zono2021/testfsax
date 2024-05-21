class UsersController < ApplicationController
  before_action :forbid_login_user,{only: [:signup, :create, :login_form, :login]}

  def signup
  end

  def create
    @user = User.new(
      username: params[:username],
      sid: params[:sid],
      email: params[:email],
      password: params[:password]
    )

    if @user.save
      
      redirect_to("/posts/index")
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to("/signup")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(sid: params[:sid], password: params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      flash[:errors] = "IDまたはパスワードが間違っています"
      redirect_to("/login")
    end
  end

    def logout
      session[:user_id] = nil
      redirect_to("/login")
    end
end
