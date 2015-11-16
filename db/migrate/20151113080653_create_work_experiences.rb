class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.integer :user_id
      t.string :job_role
      t.string :company
      t.string :summary
      t.date :start_date
      t.date :end_date
      t.boolean :is_current

      t.timestamps null: false
    end
  end
end
