class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :job_role
      t.string :company

      t.timestamps null: false
    end
  end
end
