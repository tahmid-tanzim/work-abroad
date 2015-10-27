class AlterWorkers < ActiveRecord::Migration
  def up
    rename_column("workers", "password", "hashed_password")
    add_index("workers", "email")
    add_index("workers", "national_id")
  end

  def down
    remove_index("workers", "national_id")
    remove_index("workers", "email")
    rename_column("workers", "hashed_password", "password")
  end
end
