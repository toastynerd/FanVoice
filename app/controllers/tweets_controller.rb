require 'resque'
require 'resque_scheduler'

class TweetsController < ApplicationController
  before_filter :find_character
  before_filter :find_tweet, :only => [:show, :edit, :update, :destroy]

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
      Resque.enqueue_at(@tweet.post_at, SendToTwitter, @tweet.id, @character.id)
      redirect_to [@source_material, @character, @tweet]
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
      flash[:notice]="Tweet has been udpated."
      redirect_to [@source_material, @character, @tweet]
    else
      flash[:alert]="Could not update tweet"
      render :action => "new"
    end
  end

  def destroy
    @tweet.destroy
    flash[:notice]="Tweet has been destroyed."
    redirect_to [@source_material, @character]
  end

private
  def find_character
    @character = Character.find(params[:character_id])
    @source_material = SourceMaterial.find(@character.source_material_id)
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end
end
