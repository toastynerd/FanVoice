class SourceMaterialsController < ApplicationController
  before_filter :find_source, :only => [:show, :edit, :update, :destroy]

  def index
    @source_materials = SourceMaterial.all
  end

  def new
    @source_material = SourceMaterial.new
  end

  def create
    @source_material = SourceMaterial.new(params[:source_material])
    if @source_material.save
      flash[:notice] = "You created a new source."
      redirect_to @source_material
    else
      flash[:notice] = "Could not create source."
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
    if @source_material.update_attributes(params[:source_material])
      flash[:notice]="Source material has been updated."
      redirect_to @source_material
    else
      flash[:alert]="Could not update source material."
      render :action => "edit"
    end
  end



private
  def find_source
    @source_material = SourceMaterial.find(params[:id])
  end
end
