class AddUsersToTweets < ActiveRecord::Migration
  def change
    change_table :tweets do |t|
      t.references :user, index: true
    end
  end
  def down
    change_table :tweets do |t|
      t.remove :user_id
    end
  end
end
