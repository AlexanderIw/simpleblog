class SessionsController < ApplicationController
  before_action :logged_in_user, only:[ :destory]

  #log in
  def new
  end

  #create a new log in user session
  def create
    user= User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        flash[:success]='You have been successfully signed in'
        log_in user
        params[:session][:remember_me]=="1" ? remember(user) : forget(user)
        redirect_to user
    else
      flash.now[:notice]='Incorrect login information.'
      render 'new'
    end
  end

  #delete the login user session
  def destory
    log_out if logged_in?
    redirect_to root_url
  end

end