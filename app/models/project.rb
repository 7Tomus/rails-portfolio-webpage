class Project < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3}
  validates :description, presence: true
end
