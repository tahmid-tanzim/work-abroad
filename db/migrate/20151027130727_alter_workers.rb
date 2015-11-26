class AlterWorkers < ActiveRecord::Migration
  def up
    add_index("workers", "email")
    add_index("workers", "national_id")
  end

  def down
    remove_index("workers", "national_id")
    remove_index("workers", "email")
  end
end
