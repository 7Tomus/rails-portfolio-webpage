class Page < ApplicationRecord
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 20}
end
