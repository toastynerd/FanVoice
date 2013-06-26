class UsersController < ApplicationController
  before_filter :logged_in?, :only => :dashboard
  #checks to see if the user is signed in,
  #otherwise redirects to homepage
  def confirmation
  end

  def dashboard
    @source_materials = SourceMaterial.all
    @characters = Character.all
    #render the dashboard view
  end

  private

  def logged_in?
    if current_user.nil?
      redirect_to characters_path
    end
  end
end
