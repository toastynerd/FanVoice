class CreateTwitterCharacters < ActiveRecord::Migration
  def change
    create_table :twitter_characters do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :oauth_secret

      t.timestamps
    end
  end
end
