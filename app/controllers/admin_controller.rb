class AdminController < ApplicationController
  before_action :forbid_login_user,{only: [:adsignup, :adcreate, :adlogin_form, :adlogin]}
    def adsignup
    end

    def adcreate
        @admin = Admin.new(
            admin_name: params[:admin_name],
            admin_user: params[:admin_user],
            admin_email: params[:admin_email],
            admin_password: params[:admin_password]
        )
        if @admin.save      
            redirect_to("/admin/adindex")
          else
            flash[:errors] = @admin.errors.full_messages
            redirect_to("/adsignup")
        end
    end

    def adindex
        @posts = Post.all.order(created_at: :desc)
    end

    def adlogin_form
    end

    def adlogin
      @admin = Admin.find_by(admin_user: params[:admin_user], admin_password: params[:admin_password])

    if @admin
      session[:user_id] = @admin.id
      redirect_to("/admin/adindex")
    else
      flash[:errors] = "IDまたはパスワードが間違っています"
      redirect_to("/adlogin")
    end
  end

  def adlogout
    session[:user_id] = nil
    redirect_to("/adlogin")
  end

  def addestroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/admin/adindex")
  end

  def adedit
    @post = Post.find_by(id: params[:id])
  end

  def adupdate
    @post = Post.find_by(id: params[:id])
    @post.user_id = params[:user_id]
    @post.title = params[:title]
    @post.body = params[:body]
    if @post.save
      redirect_to("/admin/adindex")
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to("/admin/adedit")
    end
  end
end
