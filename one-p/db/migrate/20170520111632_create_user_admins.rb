class CreateUserAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :user_admins do |t|
      t.string :email, null: false
      t.string :hashed_password, null: false

      t.timestamps
    end
  end
end
