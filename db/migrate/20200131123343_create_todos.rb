
# schema is a record of my data, migration are the commands i run to build the table.

class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :done

      t.timestamps
    end
  end
end
