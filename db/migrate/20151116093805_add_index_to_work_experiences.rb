class AddIndexToWorkExperiences < ActiveRecord::Migration
  def change
  	add_index :work_experiences, :user_id
  end
end
