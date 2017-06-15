class CreateStreaks < ActiveRecord::Migration[5.1]
  def change
    create_table :streaks do |t|
      t.integer :days
      t.datetime :start
      t.datetime :end
      t.timestamps
    end
  end
end
