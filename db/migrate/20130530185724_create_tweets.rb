class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.datetime :post_at
      t.references :character

      t.timestamps
    end
    add_index :tweets, :character_id
  end
end
