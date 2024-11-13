class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.string :name, null: false
      t.string :author
      t.ingeger :position
      t.timestamps
    end
  end
end
