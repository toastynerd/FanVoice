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

private
  def find_source
    @source_material = SourceMaterial.find(params[:id])
  end
end
