class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title, default: ''
      t.string :body, default: ''
      t.datetime :due_date
      t.boolean :completed, default: false
      t.boolean :remember, default: false
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
