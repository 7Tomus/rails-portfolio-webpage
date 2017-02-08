class Post < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3}
  validates :description, presence: true
end
