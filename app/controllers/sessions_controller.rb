class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        format.html {redirect_to root_path, notice: 'User was successfully authenticated.'}
      else
        flash[:alert] = 'Email / Password combination is invalid'
        format.html {render :new}
      end
    end
  end

  def destroy
    logout
  end
end
