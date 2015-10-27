class CreateWorkExperiences < ActiveRecord::Migration
  def up
    create_table :work_experiences do |t|
      t.references :worker
      t.string :company_name, :limit => 50, :null => false
      t.string :position, :limit => 25, :null => false
      t.date :from, :default => Time.now
      t.date :to, :default => Time.now
      t.timestamps null: false
    end
  end

  def down
    drop_table :work_experiences
  end
end
