class AddStartupIndexToUpvotes < ActiveRecord::Migration
  def change
  	add_index :upvotes, :user_id
  	add_index :upvotes, :startup_id
  end
end
