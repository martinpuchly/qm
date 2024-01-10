class CreateMaterialTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :material_types do |t|
      t.string :name
      t.string :unit

      t.timestamps
    end
  end
end
