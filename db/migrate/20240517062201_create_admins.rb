class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.string :admin_user
      t.string :admin_password
      t.string :admin_name
      t.string :admin_email

      t.timestamps
    end
  end
end
