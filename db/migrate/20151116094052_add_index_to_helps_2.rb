class AddIndexToHelps2 < ActiveRecord::Migration
  def change
  	add_index :helps, :user_id
  end
end
