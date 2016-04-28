class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :date_time
      t.integer :attendees
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
