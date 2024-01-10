class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :dimension
      t.string :material
      t.references :material_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
