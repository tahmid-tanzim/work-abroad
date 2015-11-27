class AlterMembers < ActiveRecord::Migration
  def up
    add_index("members", "email")
    add_index("members", "national_id")
  end

  def down
    remove_index("members", "national_id")
    remove_index("members", "email")
  end
end
