class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:images).all.order("id DESC")
  end

  def new
    @tweet = Tweet.new
    2.times{@tweet.images.build}
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    if @tweet.save
      redirect_to action: "index"
    else
      render "new"
    end

  end

  def edit
    @tweet = Tweet.find(params[:id])

    num = @tweet.images.length
    num = 2 - num

    num.times{@tweet.images.build}
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet = @tweet.update(tweet_params)
    if @tweet.save
      redirect_to action: "index"
    else
      render "edit"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(
      :content,
      images_attributes: [:id, :url]
    )
  end
end
