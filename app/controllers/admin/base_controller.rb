class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!
  def index
    @source_materials = SourceMaterial.all
    @characters = Character.all
    @uploader = Character.new.image
    @uploader.success_action_redirect = new_character_url
  end
end
