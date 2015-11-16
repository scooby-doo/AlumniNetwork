class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.belongs_to :user
    	t.belongs_to :startup

    	t.text :text

    	t.timestamps null: false
    end

    add_index :comments, :user_id
    add_index :comments, :startup_id
  end
end
