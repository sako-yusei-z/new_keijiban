class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy

  validates :title, presence: true, length: { in: 1..30 }
  validates :body, presence: true, length: { in: 1..300 }
end
