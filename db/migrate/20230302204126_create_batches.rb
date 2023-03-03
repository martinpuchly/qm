class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.references :material, null: false, foreign_key: true
      t.string :batchId
      t.string :document
      t.string :heat
      t.references :supplier, null: false, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
