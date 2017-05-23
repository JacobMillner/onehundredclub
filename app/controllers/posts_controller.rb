class PostsController < ApplicationController
  before_action :authenticate_user! , only: [:create, :destroy]

  def create
    @post = current_user.posts.build
    if @post.save
      flash[:success] = "Post Successful!"
      redirect_to root_url
    else
      render 'root'
    end
  end

  private

    def posts_params
      params.require(:posts).permit(:user_id)
    end
end
