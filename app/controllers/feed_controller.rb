class FeedController < ApplicationController
  def index
    @Feed = Post.all.order('created_at DESC')
  end
end
