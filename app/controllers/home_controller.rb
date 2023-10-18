class HomeController < ApplicationController
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
end