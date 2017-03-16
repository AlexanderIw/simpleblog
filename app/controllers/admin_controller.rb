class AdminController < ApplicationController
  before_action :logged_in_user, only:[:menu]

  def index
  end

  def menu
  end
  
end
