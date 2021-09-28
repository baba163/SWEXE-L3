class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create 
    message = params[:tweet][:message]
    tdate = Time.now  # Timeクラスで日付と時間を取り扱える．
    @tweet = Tweet.new(message: message, tdate: tdate)
    if @tweet.save # エラーなし
      flash[:notice] = '投稿しました.'
      redirect_to '/'
    else
      render 'new' # エラー時：create.html.erb ではなく, new.html.erb を利用
    end
  end
  def show
    @tweet = Tweet.find(params[:id])
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to'/'
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    message = params[:tweet][:message]
    tdate = Time.now  # Timeクラスで日付と時間を取り扱える
    @tweet = Tweet.find(params[:id])
    @tweet.update(message: message, tdate: tdate)
    if @tweet.save # エラーなし
      flash[:notice] = '投稿を編集しました．'
      redirect_to '/'
    else
      render 'edit' # update.html.erb ではなく edit.html.erb を利用
    end
  end
end
