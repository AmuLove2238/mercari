class UsersController < ApplicationController

  def logout
    
  end

  def mypage
    @user = User.new
  end

  
end
