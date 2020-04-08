class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.text :description
      t.boolean :upper_body?
      t.boolean :lower_body?

      t.timestamps null: false
    end
  end
end
