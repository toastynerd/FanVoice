class AddTwitterCharacterToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :twitter_character_id, :integer
  end
end
