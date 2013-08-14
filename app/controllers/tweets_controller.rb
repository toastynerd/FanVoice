require 'resque'
require 'resque_scheduler'

class TweetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_character
  before_filter :find_tweet, :only => [:show, :edit, :update, :destroy]
  before_filter :authorize_modify!, :only => [:edit, :update, :destroy]

  def index
    @tweets = @character.tweets.find(:all, :conditions => ['post_at >= ?', Time.now], :order => "post_at")
  end

  def new
    @tweet = @character.tweets.build
  end

  def create
    @tweet = @character.tweets.build(params[:tweet])
    if @tweet.save
      flash[:notice] = "Tweet Scheduled!"
      #Resque.enqueue_at(@tweet.post_at, SendToTwitter, @tweet.id, @character.id)
      Resque.enqueue_at(2.minutes.from_now, SendToTwitter, @tweet.id, @character.id)
      redirect_to [@character]
    else
      flash[:alert] = "Could not created tweet."
      render :action => "new"
    end
  end

  def show
    #
  end

  def edit
    #
  end

  def update
    if @tweet.update_attributes(params[:tweet])
      flash[:notice]="Tweet has been updated."
      redirect_to [@character, @tweet]
    else
      flash[:alert]="Could not update tweet"
      render :action => "new"
    end
  end

  def destroy
    @tweet.destroy
    flash[:notice]="Tweet has been destroyed."
    redirect_to @character
  end

private
  def find_character
    @character = Character.find(params[:character_id])
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end

  def authorize_modify!
    if !current_user.admin? && cannot?(:"modify tweets", @tweet)
      flash[:alert]="You cannot modify this tweet"
      redirect_to @character
    end
  end
end
