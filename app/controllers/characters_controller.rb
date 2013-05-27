class CharactersController < ApplicationController
  # GET /characters
  # GET /characters.json
  before_filter :find_source_material
  before_filter :find_character, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]


  def index
    @characters = Character.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@source_material, @characters] }
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@source_material, @character] }
    end
  end

  # GET /characters/new
  # GET /characters/new.json
  def new
    @character = @source_material.characters.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: [@source_material, @character] }
    end
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = @source_material.character.build(params[:character])
    @ticket.user = current_user

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

  # PUT /characters/1
  # PUT /characters/1.json
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
