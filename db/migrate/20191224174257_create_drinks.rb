class CreateDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :ingredientes
      t.string :metodo

      t.timestamps
    end
  end
end
