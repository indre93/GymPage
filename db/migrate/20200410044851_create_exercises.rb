class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.belongs_to :user, index: true
      t.belongs_to :workout, index: true
      t.string :name
      t.boolean :upper_body?
      t.boolean :lower_body?
      t.boolean :cardio?

      t.timestamps null: false
    end
  end
end
