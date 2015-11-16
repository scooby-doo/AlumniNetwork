class AddStartupIndexToComments < ActiveRecord::Migration
  def change
  	add_index :comments, :startup_id
  end
end
