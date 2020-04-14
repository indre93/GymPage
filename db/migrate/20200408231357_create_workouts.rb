class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.references :user, foreign_key: true
      t.datetime :date
      t.text :description
      t.string :duration

      t.timestamps
    end
  end
end
