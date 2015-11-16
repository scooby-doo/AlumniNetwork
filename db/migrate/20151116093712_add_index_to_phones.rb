class AddIndexToPhones < ActiveRecord::Migration
  def change
  	add_index :phones, :user_id
  end
end
