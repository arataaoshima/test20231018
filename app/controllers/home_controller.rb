class HomeController < ApplicationController
        require 'googleauth/id_tokens/verifier'

        protect_from_forgery except: :callback
        #before_action :verify_g_csrf_token, only:[:callback]

        def top
        end

        def login_page
        end

        def login
                @user = User.find_by(email: params[:email].downcase)
                if @user && @user.authenticate(params[:password])
                        session[:user_id] = @user.id
                        redirect_to posts_path
                else
                  render 'login_page'
                end
        end

        def logout
                session[:user_id] = nil
                redirect_to login_page_path
        end

        def callback
                payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: ENV['GOOGLE_CLIENT_ID'])
                @user = User.find_or_create_by(username:payload['given_nam'],email: payload['email'])
                session[:user_id] = @user.id
                redirect_to posts_path
        end

        private

        def verify_g_csrf_token
          if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
            redirect_to root_path, notice: '不正なアクセスです'
          end
        end

end