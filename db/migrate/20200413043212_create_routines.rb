class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines do |t|
      t.references :workout, foreign_key: true
      t.references :exercise, foreign_key: true
      t.string :caption

      t.timestamps
    end
  end
end
