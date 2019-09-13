class Preview < ApplicationRecord
  has_one_attached :image
  belongs_to :map
  enum status: [:pending, :done, :error]
end
