class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
