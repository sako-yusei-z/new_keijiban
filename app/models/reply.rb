class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates :body, presence: true, length: { in: 1..30 }
end
