class UsersController < ApplicationController

  def logout
    
  end

  def mypage
    @user = User.new
  end

  def user_mypage
  end
  
end
