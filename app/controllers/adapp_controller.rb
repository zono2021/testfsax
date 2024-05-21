class AdappController < ApplicationController
    before_action :adset_current_user

    def adset_current_user
        @current_user = Admin.find_by(id: session[:user_id])
    end

    def adauthenticate_user
      if @current_user == nil
        redirect_to("/adlogin")
      end
    end

    def adforbid_login_user
      if @current_user
        redirect_to("/admin/adindex")
      end
    end
end
