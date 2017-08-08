class PostsController < ApplicationController
  before_action :authenticate_user! , only: [:create, :destroy]

  def create
    last_post = current_user.posts.last
    #make sure they haven't posted already today
    if last_post != nil and last_post.created_at.to_date == Date.current
      flash[:failure] = "You cannot post more than once a day!"
      redirect_to root_url
    else
      @post = current_user.posts.build
      if @post.save
        flash[:success] = "Post Successful!"
        redirect_to root_url
      else
        render 'root'
      end
    end
  end

  private

    def posts_params
      params.require(:posts).permit(:user_id)
    end
end
