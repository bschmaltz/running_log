class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :name
      t.date :workout_date
      t.string :review
      t.integer :effort
      t.float :duration
      t.string :weather
      t.float :distance

      t.timestamps
    end
    add_index :workouts, [:user_id, :created_at]
  end
end
