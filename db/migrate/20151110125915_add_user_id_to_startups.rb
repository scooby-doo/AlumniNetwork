class AddUserIdToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :user_id, :integer
  end
end
