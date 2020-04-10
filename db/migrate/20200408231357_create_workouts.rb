class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.belongs_to :user, index: true
      t.text :description
      t.datetime :date_workedout

      t.timestamps null: false
    end
  end
end
