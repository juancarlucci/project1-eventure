class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.has_many :attendance

      t.timestamps
    end
  end
end
