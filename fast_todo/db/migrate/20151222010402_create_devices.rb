class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :auth_token, null: false, default: ''
      t.string :operation_system, null: false, default: ''
      t.boolean :active, null: false, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :devices, :auth_token, unique: true
  end
end
