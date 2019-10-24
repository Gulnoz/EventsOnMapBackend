class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :url
      t.belongs_to :category, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :address
      t.string :location_lat
      t.string :location_long
      t.string :date
      t.string :start_time
      t.string :end_time
    end
  end
end
