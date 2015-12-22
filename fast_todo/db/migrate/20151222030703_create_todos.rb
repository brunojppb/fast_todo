class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title, null: false, default: ''
      t.string :body, null: false, default: ''
      t.datetime :due_date, null: true
      t.boolean :completed, null: false, defalt: false
      t.boolean :remember, null: false, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
