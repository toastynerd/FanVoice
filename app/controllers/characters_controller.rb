class CharactersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_source_material
  before_filter :find_character, :only => [:show, :edit, :update, :destroy]



  def index
    @characters = Character.all
  end


  def show
  end


  def new
    @character = @source_material.characters.build
  end


  def edit
  end


  def create
    @character = @source_material.characters.build(params[:character])
    @character.user = current_user

    if @character.save
      flash[:notice] = "Character was successfully created."
      redirect_to [@source_material, @character]
    else
      flash[:alert] = "Character has not been created."
      render :action => "new"
    end
  end


  def update

    if @character.update_attributes(params[:character])
      flash[:notice] = "Character updated."
      redirect_to [@source_material, @character]
    else
      flash[:alert] = "Character not updated, please check fields."
      render :action => "edit"
    end
  end


  def destroy
    @character.destroy
    flash[:notice] = "Character has been deleted."
    redirect_to @source_material
  end

private
  def find_source_material
    @source_material = SourceMaterial.for(current_user).find(params[:source_material_id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The source_material you were looking " +
                    "for could not be found."
    redirect_to root_path
  end
  def find_character
    @character = @source_material.characters.find(params[:id])
  end
end
