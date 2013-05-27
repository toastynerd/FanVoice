class CharactersController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
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

    respond_to do |format|
      if @character.save
        format.html { redirect_to [@source_material, @character], notice: 'Character was successfully created.' }
        format.json { render json: [@source_material, @character], status: :created, location: [@source_material, @character] }
      else
        format.html { render action: "new" }
        format.json { render json: @source_material.character.errors, status: :unprocessable_entity }
      end
    end
  end


  def update

    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to [@source_material, @character], notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @source_material.character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy

    respond_to do |format|
      format.html { redirect_to @source_material }
      format.json { head :no_content }
    end
  end

  private
    def find_source_material
      @source_material = SourceMaterial.find(params[:source_material_id])
    end
    def find_character
      @character = @source_material.characters.find(params[:id])
    end
end
