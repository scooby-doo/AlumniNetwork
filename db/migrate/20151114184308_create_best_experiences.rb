class CreateBestExperiences < ActiveRecord::Migration
  def change
    create_table :best_experiences do |t|
      t.integer :user_id
      t.string :title
      t.string :summary
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
