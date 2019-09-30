class Tag < ApplicationRecord
  has_many :taggings
  has_many :maps, through: :taggings
end
