class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
