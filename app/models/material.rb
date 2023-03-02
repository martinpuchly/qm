class Material < ApplicationRecord
  belongs_to :category
  has_many :batches
end
