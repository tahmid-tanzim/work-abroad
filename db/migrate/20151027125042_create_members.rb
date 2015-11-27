class CreateMembers < ActiveRecord::Migration
  def up
    create_table :members do |t|
      t.string :name, limit: 50
      t.string :national_id, unique: true, limit: 25, null: false
      t.string :email, unique: true, limit: 255, null: false
      t.string :password_digest
      t.timestamps null: false
    end
  end

  def down
    drop_table :members
  end
end
