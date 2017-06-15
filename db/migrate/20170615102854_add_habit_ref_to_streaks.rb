class AddHabitRefToStreaks < ActiveRecord::Migration[5.1]
  def change
    add_reference :streaks, :habit, foreign_key: true
  end
end
