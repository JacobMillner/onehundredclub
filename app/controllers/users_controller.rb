class UsersController < ApplicationController
  def show
    @User = User.find(params[:id])
  end
end

