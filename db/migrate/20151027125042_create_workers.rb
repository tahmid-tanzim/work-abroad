class CreateWorkers < ActiveRecord::Migration
  def up
    create_table :workers do |t|
      t.string :fullname, :limit => 50
      t.integer :national_id, :null => false
      t.string :email, :default => '', :null => false
      t.string :password, :limit => 40
      t.timestamps null: false
    end
  end

  def down
    drop_table :workers
  end
end
