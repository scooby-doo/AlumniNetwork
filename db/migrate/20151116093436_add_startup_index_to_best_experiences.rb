class AddStartupIndexToBestExperiences < ActiveRecord::Migration
  def change
  	add_index :best_experiences, :user_id
  end
end
