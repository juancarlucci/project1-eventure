class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_location
      t.string :event_date
      t.string :event_url
      t.text :event_description
      t.string :event_image

      t.timestamps
    end
  end
end
