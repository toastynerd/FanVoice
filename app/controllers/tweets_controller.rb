require 'resque'
require 'resque_scheduler'

class TweetsController < ApplicationController
  before_filter :find_character
  before_filter :find_tweet, :only => [:show, :edit, :update, :destroy]

  def new
    @tweet = @character.tweets.build 
  end

  def create
    @tweet = @character.tweets.build(params[:tweet])
    if @tweet.save
      flash[:notice] = "tweet created"
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

private
  def find_character
    @character = Character.find(params[:character_id])
    @source_material = SourceMaterial.find(@character.source_material_id)
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end
end
