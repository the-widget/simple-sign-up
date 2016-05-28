class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :start_time
      t.string :end_time
      t.integer :workers_required
      t.timestamps null: false
    end
  end
end
