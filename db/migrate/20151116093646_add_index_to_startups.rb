class AddIndexToStartups < ActiveRecord::Migration
  def change
  	add_index :startups, :user_id
  end
end
