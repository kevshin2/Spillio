class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :cid

      t.timestamps
    end
  end
end
