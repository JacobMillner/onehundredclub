class SplashController < ApplicationController
  layout false
  def index
    if user_signed_in?
      redirect_to "/feed/index"
    end
  end
end
