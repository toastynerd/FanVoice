class TwitterCharactersController < ApplicationController
  before_filter :authorize_admin!
  def create
    @twitter_character = TwitterCharacter.from_omniauth(env["omniauth.auth"])
    @character = Character.find_by_handle(@twitter_character.name)
    puts @character
    @character.twitter_character_id = @twitter_character.id
    @character.save
    @twitter_character.save
    @source_material = SourceMaterial.find(@character.source_material_id)
    redirect_to [@character]
  end

  def destroy
  end

end
