class CreateUserFields < ActiveRecord::Migration
  def change
    create_table :user_fields do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
