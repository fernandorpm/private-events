class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :hoster_id, foreign_key: true, class_name: "User"
      t.string :event_name
      t.date :event_date
      t.string :event_location

      t.belongs_to :hoster, foreign_key: { to_table: :users}, index: true, null: false
      t.timestamps
    end
  end
end
