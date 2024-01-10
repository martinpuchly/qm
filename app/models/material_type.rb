class MaterialType < ApplicationRecord
  has_many :materials, class_name: "material", foreign_key: "material_type"
end
