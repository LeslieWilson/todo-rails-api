class CreateDaytwoTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :daytwo_todos do |t|
      t.string :field
      t.boolean :isCompleted

      t.timestamps
    end
  end
end
