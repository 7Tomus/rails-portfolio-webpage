class Project < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3}
  validates :description, presence: true
end
