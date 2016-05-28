class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :date
      t.string :start_time
      t.string :end_time
      t.integer :attendees
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
