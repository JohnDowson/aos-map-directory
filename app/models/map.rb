class Map < ApplicationRecord
  validates :file, presence: true
  validates :name, presence: true

  has_one_attached :file
  has_one :preview
end
