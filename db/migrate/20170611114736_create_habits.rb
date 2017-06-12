class CreateHabits < ActiveRecord::Migration[5.1]
  def change
    create_table :habits do |t|
      t.belongs_to :user
      t.string :name

      t.timestamps
    end
  end
end
