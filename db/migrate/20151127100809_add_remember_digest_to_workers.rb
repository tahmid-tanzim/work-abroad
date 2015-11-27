class AddRememberDigestToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :remember_digest, :string
  end
end
