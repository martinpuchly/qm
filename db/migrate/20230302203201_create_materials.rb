class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :sapId
      t.references :category, null: false, foreign_key: true
      t.string :dimension

      t.timestamps
    end
  end
end
