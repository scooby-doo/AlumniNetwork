class CreateStartupFields < ActiveRecord::Migration
  def change
    create_table :startup_fields do |t|
      t.belongs_to :startup, index: true, foreign_key: true
      t.belongs_to :field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
