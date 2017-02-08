class Comment < ApplicationRecord
  belongs_to :post
  validates :name, presence: true, length: { minimum: 1}
  validates :content, presence: true
end
