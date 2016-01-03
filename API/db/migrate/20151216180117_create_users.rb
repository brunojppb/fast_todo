class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :is_active, default: false

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
