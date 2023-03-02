class Batch < ApplicationRecord
  belongs_to :material
  belongs_to :supplier


  def self.ransackable_attributes(auth_object = nil)
    ["batchId", "created_at", "id", "material_id", "quantity", "supplier_id", "updated_at"]
  end

  
end
