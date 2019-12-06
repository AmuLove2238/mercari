class UserController < ApplicationController


  def mypage
    @user = User.new
  end

end
