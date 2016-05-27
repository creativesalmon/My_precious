class HomeController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to "/users/sign_in"
    else
      user = current_user.gender
      case user
        when 1
          @gender = 'Male.png'
        when 2
          @gender = 'Female.png'
      end
    end
  end
end