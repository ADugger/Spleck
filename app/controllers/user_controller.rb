class UserController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:show]
  def show
    @user
  end
  
  private
    def set_user
      @user = User.find(current_user.id)
    end
end
