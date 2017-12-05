class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :priority
      t.string :description
      t.datetime :date
      t.boolean :completed
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
